class Product < ActiveRecord::Base
  has_many :productsources
  
  validates :productsource_id,  :presence => true
  validates :productsource_product_code,  :presence => true
end