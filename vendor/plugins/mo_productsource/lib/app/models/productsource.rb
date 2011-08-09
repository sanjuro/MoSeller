class Productsource < ActiveRecord::Base
  validates :source_name,  :presence => true
  validates :source_type_id,  :presence => true
  validates :supplier_id,  :presence => true
end