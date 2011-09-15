class Package < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order_item
  
  attr_accessible :payload, :permalink, :created_at 
  
end