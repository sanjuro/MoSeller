require File.dirname(__FILE__) + '/test_helper'
require 'order_items_controller'
# require 'action_controller/test_process'

class OrderItemsController; def rescue_action(e) raise e end; end
 
class OrderItemsControllerTest < Test::Unit::TestCase
  def setup
    @controller = OrderItemsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :order_items
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end