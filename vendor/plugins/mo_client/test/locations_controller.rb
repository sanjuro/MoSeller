require File.dirname(__FILE__) + '/test_helper'
require 'locations_controller'
# require 'action_controller/test_process'

class LocationsController; def rescue_action(e) raise e end; end
 
class LocationsControllerTest < Test::Unit::TestCase
  def setup
    @controller = LocationsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :locations
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end