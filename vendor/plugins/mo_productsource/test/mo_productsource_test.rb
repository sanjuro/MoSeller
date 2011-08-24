require File.dirname(__FILE__) + '/test_helper'
 
class MoProductsourceTest < Test::Unit::TestCase
  load_schema
  
  class Product < ActiveRecord::Base
  end
 
  class Productsource < ActiveRecord::Base
  end
  
  class ServiceType < ActiveRecord::Base
  end  
  
  class Supplier < ActiveRecord::Base
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], Productsource.all
    assert_equal [], Product.all
    assert_equal [], ServiceType.all
    assert_equal [], Supplier.all
  end
 
end