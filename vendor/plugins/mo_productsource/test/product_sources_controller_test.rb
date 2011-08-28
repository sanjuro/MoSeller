require File.dirname(__FILE__) + '/test_helper'
require 'product_sources_controller'
# require 'action_controller/test_process'

class ProductSourcesController; def rescue_action(e) raise e end; end
 
class ProductSourcesControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProductSourcesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :product_sources
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end