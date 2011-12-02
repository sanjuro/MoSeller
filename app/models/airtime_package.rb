class AirtimePackage < Package
  
  AIRTIME_VODACOM = 'Vodacom'
  AIRTIME_MTN = 'MTN'
  AIRTIME_CELLC = 'CellC'  
  AIRTIME_VIRGIN = 'Virgin'
  AIRTIME_HEITA = 'Heita'   
  
  def get_voucher(voucher_name, payload)
    logger.info "CALLING AIRTIME GET VOUCHER"
    
    payload_array = payload.split(" ")

    case voucher_name
      when AIRTIME_VODACOM 
        voucher = "*100*01*" + payload_array[1] + "#"
      when AIRTIME_MTN 
        voucher =  "*141*" + payload_array[1] + "#"
      when AIRTIME_CELLC 
        voucher =  "*120*" + payload_array[1] + "#"
      when AIRTIME_VIRGIN 
        voucher =  "*120*" + payload_array[1] + "#"
      when AIRTIME_HEITA 
        voucher =  "*188*" + payload_array[1] + "#"
    end
  end   
  
end