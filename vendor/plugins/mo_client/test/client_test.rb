require File.dirname(__FILE__) + '/test_helper'
 
class ClientTest < Test::Unit::TestCase
  load_schema
 
  def test_client
    assert_kind_of Client, Client.new
  end
end