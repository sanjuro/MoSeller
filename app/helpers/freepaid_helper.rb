module FreepaidHelper

  SERVICE_WSDL = 'http://pi.dynalias.net:3088/airtime/' 
  # SERVICE_WSDL = 'https://matrix.dynalias.net:40443/airtime/'
  
  def FreepaidGetVoucher(transaction_options)
    # Setting up a Savon::Client representing a SOAP service.
    client = Savon::Client.new do
      wsdl.document = SERVICE_WSDL + '?wsdl'
    end
    
    # Executing a SOAP request to call a "getVoucher" action.
    begin
      response = client.request :wsdl,  :getVoucher do
        soap.input = ["getVoucher", {"xmlns" => SERVICE_WSDL}]
        soap.body = { :request => {           
            :user => transaction_options[:user], 
            :pass => transaction_options[:pass], 
            :refno => transaction_options[:ref_no],
            :network => transaction_options[:network],
            :sellvalue => transaction_options[:sell_value] 
           },
          :attributes! => { :request => { 'xsi:type' => 'tns:getVoucherIn' } }
        }
        soap.element_form_default = :unqualified
        http.headers['SOAPAction'] = SERVICE_WSDL + "getVoucher"
      end
    rescue Savon::SOAP::Fault => fault
      puts fault.to_s
    end
      
    response.to_hash
    # => {:get_voucher_response => {:reply => {:status=>"0", :message=>"request not defined", :balance=>"0", :pin=>"-", :serial=>"-", :costprice=>"0", :"@xsi:type"=>"tns:getVoucherOut"}
    
    # convert reposne hash to array
    status = response.to_hash[:get_voucher_response][:reply][:status]
    message = response.to_hash[:get_voucher_response][:reply][:message]
    balance = response.to_hash[:get_voucher_response][:reply][:balance]
    pin = response.to_hash[:get_voucher_response][:reply][:pin]
    serial = response.to_hash[:get_voucher_response][:reply][:serial]
    costprice = response.to_hash[:get_voucher_response][:reply][:costprice]
      
    voucherDetails = Hash.new
    voucherDetails = { :status => status, :message => message, :balance => balance, :pin => pin, :serial => serial, :costprice => costprice }
  end

end