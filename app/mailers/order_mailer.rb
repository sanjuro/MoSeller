class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    mail( :to => order.email, 
          :from => AppConfig.instance.admin_email,
          :subject => "Your order has been processed")
  end
  
end
