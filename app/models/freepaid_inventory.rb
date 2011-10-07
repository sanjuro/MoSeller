class FreepaidInventory < InventoryLevel
  
  def provider_class
    self.class
  end  
  
  def check_level(order_item, stock_level)
    if stock_level - (order_item.quantity * order_item.billing_price) > 100000
      return true
    else  
      return false
    end
  end
  
  def current_stock_level(product_source)
    product_source.inventory_level.stock_level
  end   
  
  def decrease_level(order_item, stock_level)
    stock_level - (order_item.quantity * order_item.billing_price)
  end     
  
end