require File.dirname(__FILE__) + '/test_helper'
 
class MoSaleTest < Test::Unit::TestCase
  load_schema
 
  class Sale < ActiveRecord::Base
  end
  
  class SaleItem < ActiveRecord::Base
  end
  
  class Product < ActiveRecord::Base
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], Sale.all
    assert_equal [], SaleItem.all
    assert_equal [], Product.all
  end
 
end