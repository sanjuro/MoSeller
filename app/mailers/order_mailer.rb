class OrderMailer < ActionMailer::Base

  def order_email(order)
    @order = order
    mail( :to => order.email, 
          :from => AppConfig.instance.admin_email,
          :subject => "Your order has been processed")
  end
  
  # Mail the package via sms
  def sms_email(order)
    @order = order
    @user = AppConfig.instance.clickatell_user
    @password = AppConfig.instance.clickatell_password
    @api_id = AppConfig.instance.clickatell_api_id
    mail( :to => AppConfig.instance.clickatell_email, 
          :from => AppConfig.instance.admin_email,
          :subject => "Your order has been processed")
  end  
  
end
