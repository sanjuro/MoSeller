require File.dirname(__FILE__) + '/test_helper'
require 'payments_controller'
# require 'action_controller/test_process'

class PaymentsController; def rescue_action(e) raise e end; end
 
class PaymentsControllerTest < Test::Unit::TestCase
  def setup
    @controller = PaymentsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :payments
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end