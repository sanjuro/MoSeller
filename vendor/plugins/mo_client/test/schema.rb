ActiveRecord::Schema.define(:version => 0) do
  create_table :client, :force => true do |t|
    t.string :unique_id
    t.string :client_id
    t.string :registered_name
    t.string :email_address
    t.integer :vat
    t.string :url
    t.string :token
    t.datetime :created_at
  end
  create_table :client_type, :options => "ENGINE=INODB" do |t|
    t.string :title
  end
  create_table :contact, :force => true do |t|
    t.integer :client_id
    t.string :contact_name
    t.string :contact_email
    t.string :contact_number
    t.integer :contact_type_id
    t.datetime :created_at
  end
  create_table :location, :force => true do |t|
    t.integer :client_id
    t.string :addr1
    t.string :addr2
    t.string :addr3
    t.string :addr4
    t.string :addr5
    t.string :latitude
    t.string :longitude
    t.integer :address_type_id
    t.datetime :created_at
  end
  create_table :location_type, :options => "ENGINE=INODB" do |t|
    t.string :title
  end
end