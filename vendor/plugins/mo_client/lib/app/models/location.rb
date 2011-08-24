class Location < ActiveRecord::Base
  
  attr_accessible :address1, :address2, :address3, :address4, :latitude, :longitude, :address_type_id  

  validates :address1,  :presence => true
  validates :address2,  :presence => true
  validates :address3,  :presence => true
  validates :address4,  :presence => true
  validates :latitude,  :presence => true
  validates :longitude,  :presence => true
  validates :address_type_id,  :presence => true
  
  belongs_to :client
end