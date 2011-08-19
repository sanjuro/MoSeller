require File.dirname(__FILE__) + '/test_helper'
 
class PaymentMethodTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of PaymentMethod, PaymentMethod.new
  end
end