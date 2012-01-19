class Freepaid < ProductSource
  include FreepaidHelper # Get Freepaid Interface
  
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
      :ref_no => order.number,
      :network => product.name.downcase!,
      :sell_value => Integer(variant.full_price)
    }    
    
    logger.info "CALLING NEWPRODUCT FROM FREEPAID"
    logger.info transaction_options
      
    # Create a Freepaid Voucher 
    productOut = get_voucher(transaction_options);
    logger.error productOut
    
    package = Package.new(:payload => "PIN: " + productOut[:pin])
    package.clazz = "AirtimePackage"
    package.save
    
    order_item.add_package(package)
    
    logger.info "CREATE NEW PACKACGE"
     
    return productOut
  end
  
  def show_product
    
  end
  
end