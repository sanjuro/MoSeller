class InventortMailer < ActionMailer::Base

  def low_inventory_email(order)
    @order = order
    mail( :to => order.email, 
          :from => "headhancho@moseller.com",
          :subject => "Your order has been processed")
  end
  
end
