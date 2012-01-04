require 'spec_helper' 

describe OrdersController do
  render_views
  login_user
  
  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end
  
end