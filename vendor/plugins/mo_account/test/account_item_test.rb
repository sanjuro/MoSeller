require File.dirname(__FILE__) + '/test_helper'
 
class AccountItemTest < Test::Unit::TestCase
  load_schema
 
  def test_client
    assert_kind_of AccountItem, AccountItem.new
  end
end