class Variant < ActiveRecord::Base
  belongs_to :product
  # delegate_belongs_to :product, :name, :description, :meta_description, :meta_keywords
  delegate_attribute :name, :description, :meta_description, :meta_keywords, :to => :product
  delegate_attribute :stock_level, :to => :inventory_level

  has_many :order_items
  has_and_belongs_to_many :option_values
    
  has_many :images, :as => :viewable, :order => :position, :dependent => :destroy
  
  has_one :product_source, :through => :product
  has_one :inventory_level, :through => :product_source

  validates :cost_price, :presence => true
  validates :customer_price, :presence => true
  validates :full_price, :presence => true

  before_save :touch_product

  include ::Scopes::Variant
  # default variant scope only lists non-deleted variants
  scope :active, where("variant.deleted_at is null")
  scope :deleted, where("not variant.deleted_at is null")
  
  def self.additional_fields
    @fields
  end

  def self.additional_fields=(new_fields)
    @fields = new_fields
  end

  def options_text
    self.option_values.sort{|ov1, ov2| ov1.option_type.position <=> ov2.option_type.position}.map { |ov| "#{ov.option_type.presentation}: #{ov.presentation}" }.to_sentence({:words_connector => ", ", :two_words_connector => ", "})
  end

  def gross_profit
    self.customer_price.nil? ? 0 : (self.customer_price - self.cost_price)
  end

  # use deleted? rather than checking the attribute directly. this
  # allows extensions to override deleted? if they want to provide
  # their own definition.
  def deleted?
    deleted_at
  end
    

  private

  # Ensures a new variant takes the product master price when price is not supplied
  def check_price
    if self.customer_price.nil?
      raise "Must supply price for variant or master.price for product." if self == product.master
      self.customer_price = product.master.customer_price
    end
  end

  def touch_product
    product.touch unless is_master?
  end
end