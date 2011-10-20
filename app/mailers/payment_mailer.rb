class PaymentMailer < ActionMailer::Base

  def receive_payment_email(email_content)
    @email_content = email_content
    mail( :to => "shad6ster@gmail.com", 
          :from => AppConfig.instance.admin_email,
          :subject => email_content)
  end
  
end
