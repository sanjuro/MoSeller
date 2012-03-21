module ImbHelper
  
  @@ELECTRCITIY_REQUEST_EMAIL = AppConfig.instance.electricity_supplier_email

  def get_voucher(transaction_options)

    # Request Electricity Pin
    logger.info 'REQUEST PRODUCT'

    ProductMailer.request_email(transaction_options).deliver
    
    logger.info "CALLING ELECTRICITY SUPPLIER"

  end

end