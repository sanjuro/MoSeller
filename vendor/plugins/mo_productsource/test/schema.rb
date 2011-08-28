ActiveRecord::Schema.define(:version => 0) do
  create_table :product_source, :options => "ENGINE=INODB" do |t|
    t.references :supplier
    t.references :product_gateway
    t.string :source_name
    
    t.timestamps
  end
  
  create_table :product_gateway, :force => true do |t|
    t.string :type
    t.string :name
    t.text :description
    t.boolean :active, :default => true
    t.string :environment, :default => "development"
    t.string :server, :default => "test"
    t.boolean :test_mode, :default => true
    t.timestamps
  end
  
  create_table :supplier, :options => "ENGINE=INODB" do |t|
    t.string   :registered_name
    t.string   :contact_number
    t.string   :email_address
    t.string   :url
    
    t.timestamps
  end
end