class FreepaidInventory < InventoryLevel
  
  def provider_class
    self.class
  end  
  
  def check_level(order_item)
    if self.amount - (order_item.quantity * order_item.billing_price)
      return true
    else  
      return true
    end
  end
  
  def decrease(amount)
    update_attributes_without_callbacks({
      :level => self.level - amount
    })  
  end   
  
  def increase(quantity)
    update_attributes_without_callbacks({
      :level => self.level + amount
    })  
  end   
  
end