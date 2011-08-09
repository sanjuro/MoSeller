require File.dirname(__FILE__) + '/test_helper'
 
class SaleTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of Sale, Sale.new
  end
end