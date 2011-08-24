class Location < ActiveRecord::Base
  
  attr_accessible :address1, :address2, :address3, :address4, :latitude, :longitude, :location_type_id  

  validates :address2,  :presence => true
  validates :address3,  :presence => true
  validates :address4,  :presence => true
  validates :location_type_id,  :presence => true
  
  belongs_to :client
end