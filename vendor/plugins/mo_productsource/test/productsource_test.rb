require File.dirname(__FILE__) + '/test_helper'
 
class ProductsourceTest < Test::Unit::TestCase
  load_schema
 
  def test_client
    assert_kind_of Productsource, Productsource.new
  end
end