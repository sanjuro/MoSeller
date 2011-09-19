class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    @url  = "http://localhost:3000/orders/" + order.id.to_s()
    mail(:to => order.email, :subject => "Your order has been processed")
  end
  
end
