class InvoiceItem < ActiveRecord::Base
  attr_accessible :description, :total
                  
  belongs_to :invoice                 
                          
end