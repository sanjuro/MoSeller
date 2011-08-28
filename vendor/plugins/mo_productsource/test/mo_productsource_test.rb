require File.dirname(__FILE__) + '/test_helper'
 
class MoProductsourceTest < Test::Unit::TestCase
  load_schema
  
  class ProductSource < ActiveRecord::Base
  end
  
  class VirtualProductSource < ActiveRecord::Base
  end 
  
  class RealProductSource < ActiveRecord::Base
  end    
  
  class Supplier < ActiveRecord::Base
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], ProductSource.all
    assert_equal [], VirtualProductSource.all
    assert_equal [], RealProductSource.all
    assert_equal [], Supplier.all
  end
 
end