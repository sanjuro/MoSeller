require File.dirname(__FILE__) + '/test_helper'
 
class MoClientTest < Test::Unit::TestCase
  load_schema
 
  class Client < ActiveRecord::Base
  end
  
  class Contact < ActiveRecord::Base
  end
  
  class Address < ActiveRecord::Base
  end
 
  def test_schema_has_loaded_correctly
    assert_equal [], Client.all
    assert_equal [], Contact.all
    assert_equal [], Address.all
  end
 
end