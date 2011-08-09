class Location < ActiveRecord::Base
  belongs_to :client
  validates :address1,  :presence => true
  validates :address2,  :presence => true
  validates :address3,  :presence => true
  validates :address4,  :presence => true
  validates :latitude,  :presence => true
  validates :longitude,  :presence => true
  validates :address_type_id,  :presence => true
end