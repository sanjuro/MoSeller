require File.dirname(__FILE__) + '/test_helper'
 
class ProductTest < Test::Unit::TestCase
  load_schema
 
  def test_product
    assert_kind_of Product, Product.new
  end
end