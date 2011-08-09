class Client < ActiveRecord::Base
  validates :registered_name,  :presence => true
  validates :email_address, :presence => true,
                    :length => { :minimum => 5 }
  validates :token,  :presence => true
  validates :tax,  :presence => true
  
  has_many :locations, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
end