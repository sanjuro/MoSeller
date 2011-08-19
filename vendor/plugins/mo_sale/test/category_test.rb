require File.dirname(__FILE__) + '/test_helper'
 
class CategoryTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of Category, Category.new
  end
end