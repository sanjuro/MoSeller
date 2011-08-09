class Sale < ActiveRecord::Base
  validates :client_id,  :presence => true
  validates :client_price, :presence => true
  validates :margin,  :presence => true
  validates :vat,  :presence => true
  validates :total,  :presence => true  
  validates :status_id,  :presence => true  
  validates :type_id,  :presence => true  
 
  has_many :sale_items, :dependent => :destroy
end