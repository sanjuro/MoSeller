require File.dirname(__FILE__) + '/test_helper'
require 'product_categorys_controller'
# require 'action_controller/test_process'

class ProductCategorysController; def rescue_action(e) raise e end; end
 
class ProductCategorysControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProductCategorysController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :product_categorys
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end