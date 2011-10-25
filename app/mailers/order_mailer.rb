class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    mail( :to => order.email, 
          :from => AppConfig.instance.admin_email,
          :subject => "Your order has been processed")
  end
  
  def statement_email(user, orders, order_total)
    @user = user
    @orders = orders
    @order_total = order_total
    mail( :to => user.email, 
          :from => AppConfig.instance.admin_email,
          :subject => "Your statement")
  end  
  
end
