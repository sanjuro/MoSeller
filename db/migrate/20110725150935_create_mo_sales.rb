class CreateMoSales < ActiveRecord::Migration
  def self.up
    create_table :categorys, :options => "ENGINE=INODB" do |t|
      t.string :title
    end    
    
    create_table :orders, :options => "ENGINE=INODB" do |t|
      t.references :suppliers
      t.references :client
      t.decimal :margin,               :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :tax,                  :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total,                :precision => 8, :scale => 2, :default => 0.0, :null => false
           
      t.timestamps
    end
    
    create_table :order_items, :options => "ENGINE=INODB" do |t|
      t.references :orders
      t.references :products
      t.integer  :variant_id
      t.integer :quantity
      t.decimal  :price,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end 
    
    create_table :payment_methods, :options => "ENGINE=INODB" do |t|
      t.references :orders
      t.references :products
      t.integer  :variant_id
      t.integer :quantity
      t.decimal  :price,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end 
    
    create_table :sales, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.decimal :margin,               :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :tax,                  :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string :status_id
      t.string :type_id
      
      t.timestamps
    end
    
    create_table :sale_items, :options => "ENGINE=INODB" do |t|
      t.references :sales
      t.references :products
      t.integer  :variant_id
      t.integer :quantity
      t.decimal  :price,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end
    

    
    create_table "state_events", :force => true do |t|
      t.integer "order_id"
      t.integer "user_id"
      t.string "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string "previous_state"
    end       
  end

  def self.down
    
  end
end
