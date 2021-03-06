class OrderItem < ActiveRecord::Base
  
  include ActionView::Helpers::NumberHelper
  include BaseHelper  
  
  attr_accessible :id, :order_id, :quantity, :customer_price, :billing_price, :full_price, 
                  :attribute_note, :created_at, :product_id, :updated_at, :variant_id
  
  before_validation :adjust_quantity
  before_validation :copy_price

  validates :variant, :presence => true
  validates :quantity, :presence => true, 
                       :numericality => { :only_integer => { :less_than_or_equal_to => 5 }, :message => I18n.t("validation.must_be_int") }
  validates :customer_price, :numericality => true
  # validate :meta_validation_of_quantities
  
  belongs_to :order
  belongs_to :variant

  has_one :product, :through => :variant
  has_many :packages

  # before_save :update_inventory
  # before_destroy :ensure_not_shipped, :remove_inventory

  after_save :update_order
  after_destroy :update_order

  def copy_price
    self.customer_price = variant.customer_price if variant && self.customer_price.nil?
  end
  
  def presentation
    self.product.name + ":" + format_price(self.full_price).to_s
  end   

  def process!
    begin
      logger.info 'PROCESS ORDER ITEM'
      # Check stock level
      if product.inventory_level.check_level(self)
        update_attribute(:product_id, variant.product_id)
        
        # get a package for the quantity
        (1..self.quantity).each do |k|
          ret = variant.product_source.new_product(variant, self)
        end
        
        # Update stock level    
        decrease_stock_level
        logger.info 'UPDATE STOCK LEVEL'
        
      else
        logger.info 'INVENTORY LEVEL LOW ' + variant.product_source.description
        self.destroy();
        InventoryMailer.low_inventory_email(variant.product_source).deliver
        raise "Stock Level Error"
      end
    rescue Exception => e
      puts "#{ e } (#{ e.class })!"
    end
  end
  
  def increment_quantity
    self.quantity += 1
  end

  def decrement_quantity
    self.quantity -= 1
  end

  def amount
    self.customer_price * self.quantity
  end
  alias total amount
  
  def cost
    self.billing_price * self.quantity
  end
  alias total cost
  
  def full
    self.full_price * self.quantity
  end
  alias total full  

  def adjust_quantity
    self.quantity = 0 if self.quantity.nil? || self.quantity < 0
  end
  
  def add_package(package)
      current_package = package
      self.packages << current_package
  end

  private
    def update_order
      # update the order totals, etc.
      order.update!
    end
    
    def decrease_stock_level
      product.inventory_level.decrease_level(self)
    end       

    def ensure_not_shipped
      if order.try(:inventory_units).to_a.any?{|unit| unit.variant_id == variant_id && unit.shipped?}
        errors.add :base, I18n.t("cannot_destory_line_item_as_inventory_units_have_shipped")
        return false
     end
  end
end