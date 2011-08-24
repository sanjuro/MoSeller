class Client < ActiveRecord::Base
  
  attr_accessible :registered_name, :email_address, :tax
  
  validates :registered_name,  :presence => true
  validates :email_address, :presence => true,
                    :length => { :minimum => 5 }
  validates :tax,  :presence => true
  
  has_many :locations, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
end