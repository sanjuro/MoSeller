class EmailsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    if request.headers["Authorization"] != AppConfig.instance.gae_app_key
      return head(:unauthorized)
    end
    # handle the email
    # UserMailer.receive(params[:email][:raw])
    puts params[:email]
    head :ok
  end
end