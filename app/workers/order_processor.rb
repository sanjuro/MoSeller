class OrderProcessor
  
  @queue = :order_queue  
  
  def self.perform(order_id)   
    
    order = Order.find_by_id!(order_id)
    puts "OrderProcessor Order " + order_id.to_s() + ": Starting Order"
    
    # order.process_payments! # process payments
    order.process_order_items! # fetch products
    puts  "OrderProcessor Order " + order_id.to_s() + ": Completed Order items processing"
    
    # do account and product stuff here   
    order.finalize! 
    puts  "OrderProcessor Order " + order_id.to_s() + ": Finalizing Order"
    
    # do billing for order this needs to be dynamic as the system might not have MoAccount
    order.billing!
    puts  "OrderProcessor Order " + order_id.to_s() + ": Billing Order"
  end 
  
end 