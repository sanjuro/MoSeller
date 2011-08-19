require File.dirname(__FILE__) + '/test_helper'
require 'payment_methods_controller'
# require 'action_controller/test_process'

class PaymentMethodsController; def rescue_action(e) raise e end; end
 
class PaymentMethodsControllerTest < Test::Unit::TestCase
  def setup
    @controller = PaymentMethodsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :payment_methods
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end