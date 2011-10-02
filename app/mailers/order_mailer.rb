class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    mail( :to => order.email, 
          :from => "headhancho@moseller.com",
          :subject => "Your order has been processed")
  end
  
end
