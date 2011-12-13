class OrderEmailProcessor
  
  @queue = :email_queue  
  
  def self.perform(order_id)   
    order = Order.find_by_id!(order_id)
    puts order
    OrderMailer.order_email(order).deliver
  end 
  
end 