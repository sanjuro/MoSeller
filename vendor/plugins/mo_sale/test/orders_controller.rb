require File.dirname(__FILE__) + '/test_helper'
require 'orders_controller'
# require 'action_controller/test_process'

class OrderController; def rescue_action(e) raise e end; end
 
class OrderControllerTest < Test::Unit::TestCase
  def setup
    @controller = OrderController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :orders
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end