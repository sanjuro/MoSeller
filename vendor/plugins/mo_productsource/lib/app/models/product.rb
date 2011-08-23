class Product < ActiveRecord::Base
  belongs_to :productsources
  
  validates :productsource_id,  :presence => true
  validates :productsource_product_code,  :presence => true
end