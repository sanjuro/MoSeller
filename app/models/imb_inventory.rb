class ImbInventory < InventoryLevel
  
  def provider_class
    self.class
  end  
  
  def check_level(order_item, stock_level)
    if stock_level - (order_item.quantity * order_item.billing_price) > 0
      return true
    else  
      return false
    end
  end
  
  def current_stock_level
    # product_source.inventory_level.stock_level
    self.stock_level
  end   
  
  def decrease_level(order_item)
    order_item_usage = order_item.quantity * order_item.billing_price
    
    current_inventory_level = InventoryLevel.current_level.find_by_product_source_id!(order_item.product.product_source_id)
    
    new_stock_level = current_inventory_level.stock_level - order_item_usage
    
    logger.info 'CALCULATED NEW INVENTORY LEVEL'
    
    inventory_level = InventoryLevel.new(:product_source_id => order_item.product.product_source_id ,
                                      :order_item_id => order_item.id,
                                      :clazz => current_inventory_level.clazz, 
                                      :stock_level => new_stock_level,
                                      :is_current => 1,
                                      :created_at => Time.zone.now                         
                                      )
    inventory_level.save
    
    logger.info 'CREATED NEW INVENTRORY LEVEL' 
    
    current_inventory_level.update_attributes_without_callbacks({
      :is_current => 0
    }) 
    
    logger.info 'UPDATED OLD INVENTRORY LEVEL'    
  end     
  
end