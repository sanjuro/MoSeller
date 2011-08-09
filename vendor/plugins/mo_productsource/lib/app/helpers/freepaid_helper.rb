module FreepaidHelper
  
  def FreepaidGetVoucher(user, pass, ref_no, network, sellValue)
    # Setting up a Savon::Client representing a SOAP service.
    client = Savon::Client.new do
      wsdl.document = "http://pi.dynalias.net:3088/airtime/?wsdl"
    end
      
    client.wsdl.soap_actions
    # => [:getVoucher]
      
    # Executing a SOAP request to call a "getVoucher" action.
    begin
      response = client.request :getVoucher do
        soap.body = { :user => user, 
          :pass => pass, 
          :refno => ref_no,
          :network => network,
          :sellvalue => sellValue
        }
        http.headers['SOAPAction'] = "http://pi.dynalias.net:3088/airtime/getVoucher"
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
    voucherDetails = { 'status' => status, 'message' => message, 'balance' => balance, 'pin' => pin, 'serial' => serial, 'costprice' => costprice }
  end

end