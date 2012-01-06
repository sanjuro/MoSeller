class InventoryLevel < ActiveRecord::Base
  belongs_to :product_source
  belongs_to :order_item
  
  attr_accessible :product_source_id, :order_item_id, :clazz, :stock_level, :is_current, :created_at
  
  validates :clazz, :presence => true
  
  @provider = nil
  
  scope :current_level, where("inventory_levels.is_current = 1")
  
  def provider_class
    self.clazz
  end
  
  def provider
    logger.error "CALLING INVENTORY PROVIDER"
    p = provider_class
    Kernel.const_get(p)
    eval(p)
    @provider = p.constantize.new(:stock_level => self.stock_level)
  end  
  
  def check_level(order_item)
    logger.error "CALLING INVENTORY CHECK LEVEL"
    current_level = self.current_stock_level!
    provider.check_level(order_item, current_level)
  end
    
  def current_stock_level!
    provider.current_stock_level
  end  
  
  def decrease_level(order_item)
    stock_level = provider.decrease_level(order_item)
  end 
  
  def state
    case self.is_current
      when true then 'current'
      when false then 'old'
    end
  end 
  
end