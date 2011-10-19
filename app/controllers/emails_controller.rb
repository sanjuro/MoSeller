class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    if request.headers["Authorization"] != AppConfig.instance.gae_app_key
      return head(:unauthorized)
    end
    # handle the email
    # UserMailer.receive(params[:email][:raw])
    
    PaymentMailer.payment_receive_email(params[:email][:raw]).deliver
    head :ok
  end
end