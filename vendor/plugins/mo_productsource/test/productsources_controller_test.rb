require File.dirname(__FILE__) + '/test_helper'
require 'productsources_controller'
# require 'action_controller/test_process'

class ProductsourcesController; def rescue_action(e) raise e end; end
 
class ProductsourcesControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProductsourcesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :productsources
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end