class CreateMoSales < ActiveRecord::Migration
  def self.up
    create_table "assets", :force => true do |t|
      t.integer  "viewable_id"
      t.string   "viewable_type", :limit => 50
      t.string   "attachment_content_type"
      t.string   "attachment_file_name"
      t.integer  "attachment_size"
      t.integer  "position"
      t.string   "type", :limit => 75
      t.datetime "attachment_updated_at"
      t.integer  "attachment_width"
      t.integer  "attachment_height"
    end    
    
    create_table :categories, :options => "ENGINE=INODB" do |t|
      t.string :title
    end    
    
    create_table "creditcards", :force => true do |t|
      t.text     "number"
      t.string   "month"
      t.string   "year"
      t.text     "verification_value"
      t.string   "cc_type"
      t.string   "display_number"
      t.string   "first_name"
      t.string   "last_name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "start_month"
      t.string   "start_year"
      t.string   "issue_number"
      t.integer  "address_id"
    end
    
    create_table :gateways, :force => true do |t|
      t.string :type
      t.string :name
      t.text :description
      t.boolean :active, :default => true
      t.string :environment, :default => "development"
      t.string :server, :default => "test"
      t.boolean :test_mode, :default => true
      t.timestamps
    end    
    
    create_table "option_types", :force => true do |t|
      t.string "name", :limit => 100
      t.string "presentation", :limit => 100
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
    
    create_table "option_values", :force => true do |t|
      t.integer "option_type_id"
      t.string "name"
      t.integer "position"
      t.string "presentation"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "option_values_variants", :id => false, :force => true do |t|
      t.integer "variant_id"
      t.integer "option_value_id"
    end

    add_index "option_values_variants", ["variant_id"], :name => "index_option_values_variants_on_variant_id"   
    
    create_table "orders", :force => true do |t|
      t.references :supplier
      t.references :client      
      t.references "user"
      t.string "number", :limit => 15
      t.decimal "item_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "payment_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "customer_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "billing_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "full_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string "email", :limit => 30
      t.string "mobile_number", :limit => 15
      t.string   "customer_name", :limit => 20
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "completed_at"
      t.string "state"
      t.string "token"
      t.decimal "adjustment_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal "credit_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    end 
    
    add_index "orders", ["number"], :name => "index_orders_on_number"        
    
    create_table "order_items", :force => true do |t|
      t.references :order
      t.references :product
      t.integer  :variant_id
      t.integer :quantity
      t.decimal  :customer_price,            :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal  :billing_price,             :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal  :full_price,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      
      t.timestamps
    end   
    
    add_index "order_items", ["order_id"], :name => "index_line_items_on_order_id"
    add_index "order_items", ["variant_id"], :name => "index_line_items_on_variant_id"  
            
          
    create_table "payments", :force => true do |t|
      t.references :source, :polymorphic => true 
      t.string :state
      t.integer :order_id
      t.integer :payment_method_id     
      t.datetime "created_at"
      t.datetime "updated_at"
      t.decimal "amount", :precision => 8, :scale => 2, :default => 0.0, :null => false
    end     
    
    create_table :payment_methods do |t|
      t.string :type
      t.string :name
      t.string :display_on, :default => nil
      t.text :description
      t.boolean :active, :default => true
      t.string :environment, :default => "development"
      t.timestamp :deleted_at, :default => nil
      t.timestamps
    end 
    
    create_table "products", :force => true do |t|
      t.references :category
      t.references :product_source
      t.string "name", :default => "", :null => false
      t.text "description"
      t.decimal "cost_price", :precision => 8, :scale => 2, :null => true
      t.decimal "customer_price", :precision => 8, :scale => 2, :null => false
      t.string "permalink"
      t.datetime "available_on"
      t.datetime "deleted_at"
      t.string "meta_description"
      t.string "meta_keywords"
      t.timestamps
    end

    add_index "products", ["available_on"], :name => "index_products_on_available_on"
    add_index "products", ["deleted_at"], :name => "index_products_on_deleted_at"
    add_index "products", ["name"], :name => "index_products_on_name"
    add_index "products", ["permalink"], :name => "index_products_on_permalink"    
    
    create_table "product_option_types", :force => true do |t|
      t.integer "product_id"
      t.integer "option_type_id"
      t.integer "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
    
    create_table "state_events", :force => true do |t|
      t.integer "order_id"
      t.integer "user_id"
      t.string "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string "previous_state"
      t.string "next_state"
    end    
    
    create_table "variants", :force => true do |t|
      t.integer "product_id"
      t.string "sku", :default => "", :null => false
      t.decimal "cost_price", :precision => 8, :scale => 2, :null => true
      t.decimal "customer_price", :precision => 8, :scale => 2, :null => true
      t.decimal "full_price", :precision => 8, :scale => 2, :null => true
      t.datetime "deleted_at"
      t.boolean "is_master", :default => false
    end

    add_index "variants", ["product_id"], :name => "index_variants_on_product_id"     
  end

  def self.down
    
  end
end
