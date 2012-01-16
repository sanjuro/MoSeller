class CreateMoProductsource < ActiveRecord::Migration
  def self.up
    create_table :packages, :options => "ENGINE=INODB" do |t|
      t.integer :order_item_id
      t.string :payload
      t.string :permalink
      
      t.timestamps
    end     
      
    create_table :product_sources, :options => "ENGINE=INODB" do |t|
      t.references :supplier
      t.string :name
      t.string :description
      t.string :clazz
      t.datetime "deleted_at"
      
      t.timestamps
    end
    
    create_table :suppliers, :options => "ENGINE=INODB" do |t|
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