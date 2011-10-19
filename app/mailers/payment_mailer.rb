class PaymentMailer < ActionMailer::Base

  def receive_payment_email(email_content)
    @email_content = email_content
    mail( :to => order.email, 
          :from => AppConfig.instance.admin_email,
          :subject => "New Payment received")
  end
  
end
