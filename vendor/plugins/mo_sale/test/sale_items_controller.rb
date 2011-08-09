require File.dirname(__FILE__) + '/test_helper'
require 'clients_controller'
# require 'action_controller/test_process'

class SaleItemsController; def rescue_action(e) raise e end; end
 
class SaleItemsControllerTest < Test::Unit::TestCase
  def setup
    @controller = SaleItemsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :sale_items
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end