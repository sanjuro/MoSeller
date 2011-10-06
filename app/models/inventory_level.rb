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
    ret = provider.check_level(order_item)
  end
  
  def increase
    raise "You must implement increase method for this inventory level."
  end 
  
  def decrease
    raise "You must implement decrease method for this inventory level."
  end 
  
end