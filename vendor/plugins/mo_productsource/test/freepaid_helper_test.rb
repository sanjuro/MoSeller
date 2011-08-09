require File.dirname(__FILE__) + '/test_helper'
include FreepaidHelper
 
class FreepaidHelperHelperTest < Test::Unit::TestCase
  def test_FreepaidGetVoucher
    product = FreepaidGetVoucher("1952645", "rad6hia", "test_0001", "mtn", 10);
  end
end