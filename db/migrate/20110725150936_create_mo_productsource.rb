class CreateMoProductsource < ActiveRecord::Migration
  def self.up
    
    create_table :product_source, :options => "ENGINE=INODB" do |t|
      t.references :supplier
      t.references :product_gateway
      t.string :source_name
      
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

  def self.down

  end
end
