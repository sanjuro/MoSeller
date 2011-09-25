module VirtualProductSourceHelper
  include EsetHelper # Get ESET Interface
  include FreepaidHelper # Get Freepaid Interface
  
  # Send the NewOrder call to the correct product source and returns the product
  def NewOrder(productorder)
    
    product_gateway = productorder['productgatewy']
    
    case product_gateway
    when "ESET"
      #Login to the ESET License Server
      login = ESETLogin('stanford', 'rE2a6REm');
      
      #Create a license 
      product = ESETCreateLicense(login['userId'], login['sessionId'], 83, 110, 1, 0, 1, 472.00, '09/01/2012', 'Jack', 'Tester', 'Test Company', 'test@info.com', '27211231212', '');
      
    when "Freepaid"
      #Create a Freepaid Voucher 
      product = FreepaidGetVoucher(1416266, "123456", "test_0001", "vodacom", 2);
    else
      
    end
    
    return product
  end  
 
end