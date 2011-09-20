require File.dirname(__FILE__) + '/test_helper'
require 'suppliers_controller'
# require 'action_controller/test_process'

class SuppliersController; def rescue_action(e) raise e end; end
 
class SuppliersControllerTest < Test::Unit::TestCase
  def setup
    @controller = SuppliersController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :suppliers
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end