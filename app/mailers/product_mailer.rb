class ProductMailer < ActionMailer::Base
  
  helper :base  

  def request_email(transaction_options)
    @order = Order.find_by_id(transaction_options[:order_id])
    
    mail( :to => AppConfig.instance.electricity_supplier_email,
          :from => AppConfig.instance.admin_email,
          :subject => "New Electricity Request")
  end 
  
end
