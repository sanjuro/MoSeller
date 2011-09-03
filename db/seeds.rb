# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
ActiveRecord::Base.transaction do
  if Category.count ==0
    category1 = Category.new :title => "airtime"
    category1.save!
    
    category2 = Category.new :title => "antivirus"
    category2.save!
 
    category3 = Category.new :title => "electricity"
    category3.save!
    
    category4 = Category.new :title => "bandwidth"
    category4.save!
  end
  
  if Client.count == 0
    client1 = Client.new(:unique_id => "moseller", :registered_name => "Mo Seller Inc.", :email_address => "shad6ster@gmail.com", :tax => "1", :telephone => "27217062685", :url => "www.moseller.com", :token => "E2as2w222sa3jn3j")
    client1.id = 1
    client1.save!
  end
  
  if Contact.count == 0
    contact = Contact.new :client_id => 1, :contact_name => "Shadley Wentzel", :contact_email => "shad6ster@gmail.com", :contact_number => "012234232", :contact_type_id => 1
    contact.id = 1
    contact.save!
  end
  
  if ContactType.count == 0
    contacttype1 = ContactType.new :title => "primary"
    contacttype1.save!
    
    contacttype2 = ContactType.new :title => "account"
    contacttype1.save!
  end
  
  if Location.count == 0
    location = Location.new :client_id => 1, :address1 => "Blue House", :address2 => "23 Jump Street", :address3 => "Jumpville", :address4 => "Cape Town", :latitude => 11232.12323, :longitude => 12312312.123213, :location_type_id => 1
    location.id = 1
    location.save!
  end
  
  if LocationType.count == 0
    locationtype1 = LocationType.new :title => "postal"
    locationtype1.id = 1
    locationtype1.save!
    
    locationtype2 = LocationType.new :title => "physical"
    locationtype2.id = 2
    locationtype2.save!
  end
  
  if Supplier.count == 0
    supplier1 = Supplier.new :registered_name => "ESET", :contact_number => "0123453434", :email_address => "info@eset.co.za", :url => "www.eset.co.za", :token => "12as2e222sa3jn3j"
    supplier1.id = 1
    supplier1.save!
    
    supplier2 = Supplier.new :registered_name => "Freepaid", :contact_number => "0123453434", :email_address => "info@freepaid.co.za", :url => "www.freepaid.co.za", :token => "32zs2e343sa3jn3j"
    supplier2.id = 2
    supplier2.save!
    
    supplier3 = Supplier.new :registered_name => "Blizzard", :contact_number => "0123453434", :email_address => "info@blizzard.co.za", :url => "www.blizzard.co.za", :token => "12as2e333sa3jn3j"
    supplier3.id = 3
    supplier3.save!
  end

  
  if OptionType == 0
    option_type1 = OptionType.new :name => "product_code", :presentation => "ProductCode"
    option_type1.id = 1
    option_type1.save!
    
    option_type2 = OptionType.new :name => "product_update_type", :presentation => "UpdateType"
    option_type2.id = 2
    option_type2.save!  
    
    option_type3 = OptionType.new :name => "product_purchaste_type", :presentation => "PurchaseType"
    option_type3.id = 3
    option_type3.save!    
       
  end
  
  if OptionValue == 0
    option_value1 = OptionValue.new :option_type_id => 1, :name => "product_code_106", :position => 1, :presentation => "NOD32"
    option_value1.id = 1
    option_value1.save!
    
    option_value2 = OptionValue.new :option_type_id => 2, :name => "update_type_1_year", :position => 1, :presentation => "1 Year"
    option_value2.id = 2
    option_value2.save! 
    
    option_value3 = OptionValue.new :option_type_id => 3, :name => "update_type_2_year", :position => 2, :presentation => "2 Year"
    option_value3.id = 3
    option_value3.save!    
    
    option_value4 = OptionValue.new :option_type_id => 3, :name => "purchase_type_new", :position => 2, :presentation => "New"
    option_value4.id = 4
    option_value4.save!       
  end  
  
  if Product.count == 0
    product = Product.new :category_id => 1, :product_source_id => 1, :name => "NOD32", :cost_price => 236.00, :description => "ESET NOD32", :customer_price => 312.00
    product.id = 1
    product.save!
  end  
  
  if ProductSource.count == 0
    product_source1 = ProductSource.new :name => "ESET", :description => "ESET SOAP Gateway", :clazz => "eset_helper"
    product_source1.id = 1
    product_source1.save!
    
    product_source2 = ProductSource.new :name => "Freepaid", :description => "Freepaid Airtime API", :clazz => "freepaid_helper"
    product_source2.id = 2
    product_source2.save!
  end 
  
  if User.count == 0
    user = User.new :name => "shadley", :client_id => 1, :email => "shad6ster@gmail.com", :password => "rad6hia", :password_confirmation => "rad6hia"
    user.id = 1
    user.save!
  end
  
  if Variant.count == 0
    variant = Variant.new :product_id => 1, :customer_price => 312.00, :sku => "ESET000000106", :cost_price => 236.00, :is_master => true
    variant.id = 1
    variant.save!
  end
  
end
