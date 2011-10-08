class ESET < ProductSource
  include EsetHelper # Get ESET Interface 
  
  SERIVCE_USERNAME = AppConfig.instance.eset_username
  SERIVCE_PASSOWRD = AppConfig.instance.eset_password

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
  
  def new_product!(variant, order)
    # Login to the ESET License Server
    login = ESETLogin(SERIVCE_USERNAME, PASSWORD);
    
    # Build Transaction options for the call to the Licensing server
    transaction_options = {
      :user_id => login['userId'],
      :session => login['sessionId'],
      :country_code => 83,
      :product_code => 110,
      :workstation_count => 1,
      :servers_count => 0,
      :update_type => 1,
      :d_price => 312.00,
      :expiration_date => '09/01/2012',
      :first_name => 'Test',
      :last_name => 'Tester',
      :company_name => 'Tester Inc.',
      :customer_email => 'tester@gmail.com',
      :phone_number => '27217551231',
      :note => 'New License',
    }
    
    # Create a license 
    # product_out = ESETCreateLicense(login['userId'], login['sessionId'], 83, 110, 1, 0, 1, 472.00, '09/01/2012', 'Jack', 'Tester', 'Test Company', 'test@info.com', '27211231212', ''
    product_out = ESETCreateLicense(transaction_options);
    logger.debug("\nCreate New ESET License Product")
    logger.debug(" transaction_options: #{transaction_options.inspect}")
    logger.debug(" response: #{product_out.inspect}\n")
    product_out
  end
  
  def show_product()
    
  end
  
end