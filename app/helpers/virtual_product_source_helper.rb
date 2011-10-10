module VirtualProductSourceHelper
  include FreepaidHelper # Get Freepaid Interface
  
  # Send the NewOrder call to the correct product source and returns the product
  def NewOrder(productorder)
    
    product_gateway = productorder['productgatewy']
    
    case product_gateway
    when "Freepaid"
      #Create a Freepaid Voucher 
      product = FreepaidGetVoucher(1416266, "123456", "test_0001", "vodacom", 2);
    else
      
    end
    
    return product
  end  
 
end