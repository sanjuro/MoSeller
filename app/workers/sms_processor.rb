class SmsProcessor
  
  @queue = :sms_queue  
  
  def self.perform(order_id)   
    
    order = Order.find_by_id!(order_id)
    puts "SmsProcesor Order" + order_id.to_s() + ": Starting Order"    
    
    sms = SMS.new()
    sms.create(order.mobile_number, order)
  end 
  
end 