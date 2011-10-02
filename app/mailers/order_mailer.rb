class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    @url  = "http://http://107.20.141.187:3000/orders/" + order.id.to_s()
    mail(:to => order.email, :subject => "Your order has been processed")
  end
  
end
