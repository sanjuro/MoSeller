require File.dirname(__FILE__) + '/test_helper'
require 'categorys_controller'
# require 'action_controller/test_process'

class CategorysController; def rescue_action(e) raise e end; end
 
class CategorysControllerTest < Test::Unit::TestCase
  def setup
    @controller = CategorysController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :categorys
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end