class Package < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :order_item, :foreign_key => "order_item_id", :class_name => "OrderItem"
  
  attr_accessible :order_item_id, :payload, :permalink, :updated_at, :created_at 
  
end