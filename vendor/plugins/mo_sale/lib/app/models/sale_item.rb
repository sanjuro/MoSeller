class SaleItem < ActiveRecord::Base
  validates :sale_id,  :presence => true
  validates :product_id,  :presence => true
  validates :quantity,  :presence => true
  validates :price,  :presence => true
end