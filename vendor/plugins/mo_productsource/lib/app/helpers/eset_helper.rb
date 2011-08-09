module EsetHelper
  
  Gyoku.convert_symbols_to :none
  Savon.env_namespace = :soap
 
  def ESETLogin(username, password)
    # Setting up a Savon::Client representing a SOAP service.
    client = Savon::Client.new do
      wsdl.document = "https://dextertest.eset.com/DexterDev/Services/SecurityService.asmx?WSDL"
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
  
  
  def ESETCreateLicense(userId, sessionId, countryId, productCode, workstationCount, serversCount, updateTypeId, dPrice, dExpirationDate, firstName, lastName, companyName, customerEmail, phoneNumber, note)
    # Setting up a Savon::Client representing a SOAP service.
    client = Savon::Client.new do
      wsdl.document = "https://dextertest.eset.com/DexterDev/Services/LicenceService.asmx?WSDL"
    end

      
    # Executing a SOAP request to call a "CreateLicence" action.
    begin
      response = client.request :wsdl, :CreateLicence do
        soap.input = ["CreateLicence", {"xmlns" => "https://secure.eset.sk/dexter/"}]
        soap.body = {
          :userId => userId,
          :sessionId  => sessionId,
          :countryID  => countryId,
          :productCode  => productCode,   
          :workstationCount => workstationCount,
          :serversCount => serversCount,
          :updateTypeID => updateTypeId,
          :dPrice => dPrice,
          :dExpirationDate => dExpirationDate,
          :firstName => firstName,
          :lastName => lastName,
          :companyName => companyName,
          :customerEmail => customerEmail,
          :phone_number => phoneNumber,
          :note => note
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
 
end