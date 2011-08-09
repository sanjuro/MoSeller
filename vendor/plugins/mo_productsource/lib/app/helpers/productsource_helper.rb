module ProductsourceHelper
  include EsetHelper # Get ESET Interface
  include FreepaidHelper # Get Freepaid Interface
  
  # Send the NewOrder call to the correct product source and returns the product
  def NewOrder(productsource)
    case productsource
    when "ESET"
      #Login to the ESET License Server
      login = ESETLogin('stanford', 'rE2a6REm');
      
      #Create a license 
      product = ESETCreateLicense(login['userId'], login['sessionId'], 83, 110, 1, 0, 1, 472.00, '09/01/2012', 'Jack', 'Tester', 'Test Company', 'test@info.com', '27211231212', '');
      
    when "Freepaid"
      #Create a Voucher 
      product = FreepaidGetVoucher(1416266, "rad6hia", "test_0001", "vodacom", 2);
    else
      
    end
    
    return product
  end  
 
end