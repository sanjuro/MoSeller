class InvoiceItem < ActiveRecord::Base
  attr_accessible :description, :quantity, :total
                  
  belongs_to :invoice                 
                          
end