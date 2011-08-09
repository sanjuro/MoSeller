require File.dirname(__FILE__) + '/test_helper'
 
class SaleItemTest < Test::Unit::TestCase
  load_schema
 
  def test_sale_item
    assert_kind_of SaleItem, SaleItem.new
  end
end