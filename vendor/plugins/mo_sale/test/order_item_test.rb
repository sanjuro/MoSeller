require File.dirname(__FILE__) + '/test_helper'
 
class OrderItemTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of OrderItem, OrderItem.new
  end
end