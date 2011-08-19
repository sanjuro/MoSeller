require File.dirname(__FILE__) + '/test_helper'
 
class PaymentTest < Test::Unit::TestCase
  load_schema
 
  def test_sale
    assert_kind_of Payment, Payment.new
  end
end