class CreateMoProductsource < ActiveRecord::Migration
  def self.up
    create_table :product, :options => "ENGINE=INODB" do |t|
      t.references :productsource
      t.references :supplier
      t.integer :productsource_product_code
      t.string "name", :default => "", :null => false
      t.text "description"
      t.string "meta_description"
      t.string "meta_keywords"
      
      t.timestamps
    end
    
    create_table :productsource, :options => "ENGINE=INODB" do |t|
      t.references :supplier
      t.references :product_source_type
      t.string :source_name
      
      t.timestamps
    end
    
    create_table :source_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :supplier, :options => "ENGINE=INODB" do |t|
      t.string   :registered_name
      t.string   :contact_number
      t.string   :email_address
      t.string   :url
      t.string   :token
      
      t.timestamps
    end        
  end

  def self.down

  end
end
