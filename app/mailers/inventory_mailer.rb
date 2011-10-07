class InventoryMailer < ActionMailer::Base

  def low_inventory_email(product_source)
    @product_source = product_source
    mail( :to => 'shad6ster@gmail.com', 
          :from => "headhancho@moseller.com",
          :subject => "Stock is running low for " + product_source.description)
  end
  
end
