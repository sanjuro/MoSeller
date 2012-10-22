class Category < ActiveRecord::Base
  
  attr_accessible :title

  has_many :products 
  has_and_belongs_to_many :users
end
