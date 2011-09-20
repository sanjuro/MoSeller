require File.dirname(__FILE__) + '/test_helper'
 
class MoAccountTest < Test::Unit::TestCase
  load_schema
  
  class AccountItem < ActiveRecord::Base
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], AccountItem.all
  end
 
end