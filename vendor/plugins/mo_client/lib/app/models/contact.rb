class Contact < ActiveRecord::Base

  attr_accessible :contact_name, :contact_email, :contact_type_id  
  
  validates :contact_name,  :presence => true
  validates :contact_email, :presence => true,
                    :length => { :minimum => 5 }
  validates :contact_type_id,  :presence => true
  
  belongs_to :client
end