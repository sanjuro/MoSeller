require File.dirname(__FILE__) + '/test_helper'
require 'clients_controller'
# require 'action_controller/test_process'

class SalesController; def rescue_action(e) raise e end; end
 
class SalesControllerTest < Test::Unit::TestCase
  def setup
    @controller = SalesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :sales
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end