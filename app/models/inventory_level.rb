class InventoryLevel < ActiveRecord::Base
  belongs_to :product_source
  belongs_to :order_item
  
  attr_accessible :product_source_id, :order_item_id, :clazz, :stock_level, :is_current, :created_at
  
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
    @provider = p.constantize.new
  end  
  
  def check_level(order_item)
    logger.error "CALLING INVENTORY CHECK LEVEL"
    current_level = self.current_stock_level!
    provider.check_level(order_item, current_level)
  end
    
  def current_stock_level!
    provider.current_stock_level(product_source)
  end  
  
  def decrease_level(order_item)
    stock_level = provider.decrease_level(order_item, self.current_stock_level!)
    # update_attribute(:stock_level, stock_level)
  end 
  
  def state
    case self.is_current
      when true then 'current'
      when false then 'old'
    end
  end 
  
end