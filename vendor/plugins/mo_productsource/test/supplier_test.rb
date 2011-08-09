require File.dirname(__FILE__) + '/test_helper'
 
class SupplierTest < Test::Unit::TestCase
  load_schema
 
  def test_client
    assert_kind_of Supplier, Supplier.new
  end
end