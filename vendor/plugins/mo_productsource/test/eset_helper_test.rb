require File.dirname(__FILE__) + '/test_helper'
include EsetHelper
 
class EsetHelperTest < Test::Unit::TestCase
  def test_ESETLogin
    #Login to the ESET License Server
    login = ESETLogin('stanford', 'rE2a6REm');
    
    #Create a license 
    product = ESETCreateLicense(login['userId'], login['sessionId'], 83, 110, 1, 0, 1, 472.00, '09/01/2012', 'Jack', 'Tester', 'Test Company', 'test@info.com', '27211231212', '');
  end
end