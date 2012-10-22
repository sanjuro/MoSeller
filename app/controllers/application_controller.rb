class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from FbGraph::Exception, :with => :fb_graph_exception
  
  before_filter :prepare_for_mobile

  def fb_graph_exception(e)
    flash[:error] = {
      :title => e.class,
      :message => e.message
    }
    gflash :error => e.message
    current_user.try(:destroy)
    redirect_to root_url
  end
  
  def set_current_user
    User.current = current_user
  end
  
  private
  
  MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]
  
  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device? == 'mobile'
  end    
    
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      agent = request.headers["HTTP_USER_AGENT"].downcase
      MOBILE_BROWSERS.each do |m|
        return "mobile" if agent.match(m)
      end
    end
  end
  helper_method :mobile_device?
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'admin' && password == 'password'
    end
  end

end
