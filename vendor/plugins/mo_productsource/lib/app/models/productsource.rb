class Productsource < ActiveRecord::Base
  
  attr_accessible :source_name, :service_type_id, :supplier_id
  
  belongs_to :supplier, :foreign_key => "productsource_supplier_id", :class_name => "Supplier"  
  belongs_to :service_type, :foreign_key => "productsource_service_type_id", :class_name => "ServiceType"  
  
  validates :source_name,  :presence => true
  validates :service_type_id,  :presence => true
  validates :supplier_id,  :presence => true
end