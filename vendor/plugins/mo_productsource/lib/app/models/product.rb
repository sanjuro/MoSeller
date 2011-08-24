class Product < ActiveRecord::Base
  belongs_to :productsources
  
  attr_accessible :name, :description, :meta_description, :productsource_product_code, :productsource
  
  validates :productsource_id,  :presence => true
  validates :productsource_product_code,  :presence => true
end