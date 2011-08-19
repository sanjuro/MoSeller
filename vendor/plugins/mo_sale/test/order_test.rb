require File.dirname(__FILE__) + '/test_helper'
 
class OrderTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of Order, Order.new
  end
end