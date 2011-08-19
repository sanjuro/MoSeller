require File.dirname(__FILE__) + '/test_helper'
 
class ProductCategoryTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of ProductCategory, ProductCategory.new
  end
end