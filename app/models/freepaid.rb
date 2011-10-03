class Freepaid < ProductSource
  include FreepaidHelper # Get Freepaid Interface
  
  # SERIVCE_USERNAME = '1416266'
  # SERVICE_PASSOWRD = '123456'
  SERVICE_USERNAME = '1952645'
  SERVICE_PASSOWRD = 'rad6hia'
  
  def provider_class
    self.class
  end

  def options
    # add :test key in the options hash, as that is what the ActiveMerchant::Billing::AuthorizeNetGateway expects
    if self.prefers? :test_mode
      self.class.default_preferences[:test] = true
    else
      self.class.default_preferences.delete(:test)
    end
    super
  end
  
  # def new_product(product_options)
  def new_product(variant, order_item)
    
    order = order_item.order
    product = Product.find_by_id!(variant.product_id)
    
    # Build Transaction options for the call to the Licensing server
    transaction_options = {
      :user => SERVICE_USERNAME,
      :pass => SERVICE_PASSOWRD,
      :ref_no => order.number,
      :network => product.name.downcase!,
      :sell_value => Integer(variant.full_price)
    }    
    
    logger.info "CALLING NEWPRODUCT FROM FREEPAID "
      
    # Create a Freepaid Voucher 
    productOut = FreepaidGetVoucher(transaction_options);
    logger.error productOut
    
    package = Package.new(:payload => "PIN: " + productOut[:pin] + ", SERIAL: " + productOut[:serial])
    package.save
    
    order_item.add_package(package)
    
    logger.info "CREATE NEW PACKACGE"
     
    return productOut
  end
  
  def show_product
    
  end
  
end