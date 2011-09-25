module EsetHelper
  
  Gyoku.convert_symbols_to :none
  Savon.env_namespace = :soap
 
  def ESETLogin(username, password)
    # Setting up a Savon::Client representing a SOAP service.
    client = Savon::Client.new do
      wsdl.document = SECURITY_SERVICE_WSDL_URL
    end
      
      
    # Executing a SOAP request to call a "CreateLicence" action.
    begin
      response = client.request :wsdl, :UserLogOn do
        soap.input = ["UserLogOn", {"xmlns" => "https://secure.eset.sk/dexter/"}]
        soap.body = {
          :username => username,
          :password  => password,
        }
        soap.element_form_default = :unqualified
        http.headers['SOAPAction'] = "https://secure.eset.sk/dexter/UserLogOn"
      end
    rescue Savon::SOAP::Fault => fault
      puts fault.to_s
    end
     
    # convert reposne hash to array
    userId = response.to_hash[:user_log_on_response][:user_log_on_result][:user_id]
    sessionId = response.to_hash[:user_log_on_response][:user_log_on_result][:session_id]
    # => { :user_log_on_response => {:user_log_on_result => { :user_id => "The", :session_id => "Hoff" } }
      
    loginSession = Hash.new
    loginSession = { 'userId' => userId, 'sessionId' => sessionId }
      
    return loginSession
  end  
  
  
  def ESETCreateLicense(transaction_options)
    # Setting up a Savon::Client representing a SOAP service.
    client = Savon::Client.new do
      wsdl.document = LICENSE_SERVICE_WSDL_URL
    end

      
    # Executing a SOAP request to call a "CreateLicence" action.
    begin
      response = client.request :wsdl, :CreateLicence do
        soap.input = ["CreateLicence", {"xmlns" => "https://secure.eset.sk/dexter/"}]
        soap.body = {
          :userId => transaction_options["user_id"],
          :sessionId  => transaction_options["session_id"],
          :countryID  => transaction_options["country_id"],
          :productCode  => transaction_options["product_code"],   
          :workstationCount => transaction_options["workstation_count"],
          :serversCount => transaction_options["servers_count"],
          :updateTypeID => transaction_options["update_type"],
          :dPrice =>  transaction_options["d_price"],
          :dExpirationDate =>  transaction_options["expiration_date"],
          :firstName =>  transaction_options["first_name"],
          :lastName =>  transaction_options["last_name"],
          :companyName =>  transaction_options["company_name"],
          :customerEmail =>  transaction_options["customer_email"],
          :phone_number =>  transaction_options["phone_number"],
          :note =>  transaction_options["note"]
        }
        soap.element_form_default = :unqualified
        http.headers['SOAPAction'] = "https://secure.eset.sk/dexter/CreateLicence"
      end
    rescue Savon::SOAP::Fault => fault
      puts fault.to_s
    end
    puts response.to_hash
    # response.to_hash[:create_license_response][:create_licence_result]
    # => { :create_license_response => { :create_licence_result => { :username => "DEV-05940943", :password => "57hdxerbrk", :expiration_date => "09/01/2012", :price => 472, :error => 0 } }
    
    # convert reposne hash to array
    username = response.to_hash[:create_licence_response][:create_licence_result][:user_name]
    password = response.to_hash[:create_licence_response][:create_licence_result][:password]
    expirationDate = response.to_hash[:create_licence_response][:create_licence_result][:expiration_date]
    price = response.to_hash[:create_licence_response][:create_licence_result][:price]
    error = response.to_hash[:create_licence_response][:create_licence_result][:error]
      
    licenseDetails = Hash.new
    licenseDetails = { 'username' => username, 'password' => password, 'expirationDate' => expirationDate, 'price' => price, 'error' => error }
  end
  
  private

  LICENSE_SERVICE_WSDL_URL = "https://dextertest.eset.com/DexterDev/Services/LicenceService.asmx?WSDL"
  SECURITY_SERVICE_WSDL_URL = "https://dextertest.eset.com/DexterDev/Services/SecurityService.asmx?WSDL"
 
end