class Productsource < ActiveRecord::Base
  belongs_to :supplier
  
  validates :source_name,  :presence => true
  validates :source_type_id,  :presence => true
  validates :supplier_id,  :presence => true
end