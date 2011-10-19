# curl -d "email=asdasd" http://www.moseller.com:3000/emails/

class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
  end

  def create
    if request.headers["Authorization"] != AppConfig.instance.gae_app_key
      return head(:unauthorized)
    end
    # handle the email
    # UserMailer.receive(params[:email][:raw])
    
    PaymentMailer.receive_payment_email(params[:email]).deliver
    head :ok
  end
end