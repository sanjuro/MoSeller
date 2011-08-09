require File.dirname(__FILE__) + '/test_helper'
 
class ContactTest < Test::Unit::TestCase
  load_schema
 
  def test_client
    assert_kind_of Contact, Contact.new
  end
end