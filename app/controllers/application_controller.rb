class ApplicationController < ActionController::Base

  protect_from_forgery

  rescue_from FbGraph::Exception, :with => :fb_graph_exception

  def fb_graph_exception(e)
    flash[:error] = {
      :title => e.class,
      :message => e.message
    }
    gflash :error => e.message
    current_user.try(:destroy)
    redirect_to root_url
  end
  
  private
 
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'password'
    end
  end

 
end