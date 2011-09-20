require File.dirname(__FILE__) + '/test_helper'
require 'suppliers_controller'
# require 'action_controller/test_process'

class AccountItemsController; def rescue_action(e) raise e end; end
 
class SuppliersControllerTest < Test::Unit::TestCase
  def setup
    @controller = AccountItemsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :account_items
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end