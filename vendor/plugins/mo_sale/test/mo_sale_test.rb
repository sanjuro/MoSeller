require File.dirname(__FILE__) + '/test_helper'
 
class MoSaleTest < Test::Unit::TestCase
  load_schema
  
  class Category < ActiveRecord::Base
  end   
  
  class OrderItem < ActiveRecord::Base
  end 
  
  class Order < ActiveRecord::Base
  end 
  
  class Payment < ActiveRecord::Base
  end 
  
  class PaymentMethods < ActiveRecord::Base
  end   
  
  class Product < ActiveRecord::Base
  end 
 
  def test_schema_has_loaded_correctly
    assert_equal [], Category.all
    assert_equal [], OrderItem.all
    assert_equal [], Order.all
    assert_equal [], Payment.all
    assert_equal [], PaymentMethod.all
    assert_equal [], Product.all
  end
 
end