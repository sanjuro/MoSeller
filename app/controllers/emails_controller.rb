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
    
    # Capture Payment Account Item
    # account_item = AccountItem.new( :credit => params[:total], 
    #                                :debit => 0.00)
    # account_item.user = params[:user]
    # account_item.account_item_type_id = 2
    # account_item.account_status_id =  1
    # account_item.save
    
    PaymentMailer.receive_payment_email(params[:subject]).deliver
    head :ok
  end
end