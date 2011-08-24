class Supplier < ActiveRecord::Base
  
  attr_accessible :registered_name, :contact_number, :email_address, :url  
    
  validates :registered_name,  :presence => true
  validates :contact_number,  :presence => true
  validates :email_address,  :presence => true
  validates :url,  :presence => true
  validates :token,  :presence => true
end