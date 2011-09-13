class VirtualProduct < ActiveRecord::Base
  has_many :products, :as => :source  
  
  def new_product(amount, payment)
  end
  
end  