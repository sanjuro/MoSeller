class AirtimePackage < Package
  
  AIRTIME_VODACOM = 'Vodacom'
  AIRTIME_MTN = 'MTN'
  AIRTIME_CELLC = 'CellC'  
  AIRTIME_VIRGIN = 'Virgin'
  AIRTIME_HEITA = 'Heita'   
  
  def get_voucher(voucher_name, payload)
    payload_array = payload.split(" ")

    case voucher_name
      when AIRTIME_VODACOM 
        voucher = {
                :text => "*100*01*" + payload_array[1] + "#", 
                :image => "#{RAILS_ROOT}/public/images/logos/vodacom_voucher.png"
              }
      when AIRTIME_MTN 
        voucher = {
                :text => "*141*" + payload_array[1] + "#", 
                :image => "#{RAILS_ROOT}/public/images/logos/mtn_voucher.png"
              }
      when AIRTIME_CELLC 
        voucher = {
                :text => "*102*" + payload_array[1] + "#", 
                :image => "#{RAILS_ROOT}/public/images/logos/cellc_voucher.png"
              }
      when AIRTIME_VIRGIN 
        voucher = {
                :text => "*102*" + payload_array[1] + "#", 
                :image => "#{RAILS_ROOT}/public/images/logos/virgin_voucher.png"
              }
      when AIRTIME_HEITA 
        voucher = {
                :text => "*188*" + payload_array[1] + "#", 
                :image => "#{RAILS_ROOT}/public/images/logos/heita_voucher.png"
              }
    end
  end   
  
end