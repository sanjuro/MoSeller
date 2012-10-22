class Imb < ProductSource
  include ImbHelper # Get Freepaid Interface
  
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
    
    # Build Transaction options for the call to the Imb Server
    transaction_options = {
      :meter_number => order_item.attribute_note,
      :order_id => order.id,
      :ref_no => order.number,
      :network => product.name.downcase!,
      :sell_value => Integer(variant.cost_price)
    }    
    
    logger.info "CALLING NEWPRODUCT FROM IMB"
    logger.info transaction_options
      
    # Create a Freepaid Voucher 
    productOut = get_voucher(transaction_options);
    
    logger.info "CREATE NEW PACKAGE"
     
    return true
  end
  
end