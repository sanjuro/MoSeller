class InventoryLevel < ActiveRecord::Base
  belongs_to :product_source
  
  attr_accessible :product_source, :amount, :clazz  
  
  @provider = nil
  
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
    ret = provider.check_level(order_item, current_level)
  end
    
  def current_stock_level!
    provider.current_stock_level(product_source)
  end  
  
  def decrease_level(order_item)
    stock_level = provider.decrease_level(order_item, self.current_stock_level!)
    update_attribute(:stock_level, stock_level)
  end 
  
end