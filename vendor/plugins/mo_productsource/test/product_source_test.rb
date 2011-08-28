require File.dirname(__FILE__) + '/test_helper'
 
class ProductSourceTest < Test::Unit::TestCase
  load_schema
 
  def test_client
    assert_kind_of ProductSource, ProductSource.new
  end
end