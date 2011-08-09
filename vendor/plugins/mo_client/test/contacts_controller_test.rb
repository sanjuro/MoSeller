require File.dirname(__FILE__) + '/test_helper'
require 'contacts_controller'
# require 'action_controller/test_process'

class ContactsController; def rescue_action(e) raise e end; end
 
class ContactsControllerTest < Test::Unit::TestCase
  def setup
    @controller = ContactsController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
 
    ActionController::Routing::Routes.draw do |map|
      map.resources :contacts
    end
  end
 
  def test_index
    get :index
    assert_response :success
  end
end