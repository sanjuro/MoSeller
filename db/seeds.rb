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
  
  if ServiceType.count == 0
    servicetype1 = ServiceType.new :title => "soap"
    servicetype1.id = 1
    servicetype1.save!
    
    servicetype2 = ServiceType.new :title => "rest"
    servicetype2.id = 2
    servicetype2.save!
  end
  
  if Productsource.count == 0
    productsource1 = Productsource.new :source_name => "ESET", :service_type_id => 1, :supplier_id => 1
    productsource1.id = 1
    productsource1.save!
    
    productsource2 = Productsource.new :source_name => "Freepaid", :service_type_id => 2, :supplier_id => 2
    productsource2.id = 2
    productsource2.save!
  end
  
  if User.count == 0
    user = User.new :name => "shadley", :client_id => 1, :email => "shad6ster@gmail.com", :password => "rad6hia", :password_confirmation => "rad6hia"
    user.id = 1
    user.save!
  end
  
end
