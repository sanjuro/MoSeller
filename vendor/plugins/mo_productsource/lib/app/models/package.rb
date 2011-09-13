class Package < ActiveRecord::Base
  has_one :order
  
  
  attr_accessible :payload, :permalink, :created_at 
  
end