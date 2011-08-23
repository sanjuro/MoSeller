class CreateMoSales < ActiveRecord::Migration
  def self.up
    create_table :category, :options => "ENGINE=INODB" do |t|
      t.string :title
    end    
    
    create_table :order, :options => "ENGINE=INODB" do |t|
      t.references :supplier
      t.references :client
      t.decimal :margin,               :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :tax,                  :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total,                :precision => 8, :scale => 2, :default => 0.0, :null => false
           
      t.timestamps
    end
    
    create_table :order_item, :options => "ENGINE=INODB" do |t|
      t.references :order
      t.references :product
      t.integer  :variant_id
      t.integer :quantity
      t.decimal  :price,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end 
    
    create_table :product_category, :options => "ENGINE=INODB" do |t|
      t.references :order
      t.references :product
      t.timestamps
    end 
    
    create_table :sale, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.decimal :margin,               :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :tax,                  :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string :status_id
      t.string :type_id
      
      t.timestamps
    end
    
    create_table :sale_item, :options => "ENGINE=INODB" do |t|
      t.references :sale
      t.references :product
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
