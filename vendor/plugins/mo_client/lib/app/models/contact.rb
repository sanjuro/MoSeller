class Contact < ActiveRecord::Base
  belongs_to :client
  validates :contact_name,  :presence => true
  validates :contact_email, :presence => true,
                    :length => { :minimum => 5 }
  validates :contact_type_id,  :presence => true
end