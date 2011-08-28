ActiveRecord::Schema.define(:version => 0) do
  create_table :category, :options => "ENGINE=INODB" do |t|
    t.string :title
  end    
  
  create_table "order", :force => true do |t|
    t.references :supplier
    t.references :client      
    t.integer "user_id"
    t.string "number", :limit => 15
    t.decimal "item_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal "customer_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal "billing_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal "full_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "state"
    t.string "token"
    t.decimal "adjustment_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal "credit_total", :precision => 8, :scale => 2, :default => 0.0, :null => false
  end 
  
  add_index "orders", ["number"], :name => "index_orders_on_number"        
  
  create_table "order_item", :force => true do |t|
    t.references :order
    t.references :product
    t.integer  :variant_id
    t.integer :quantity
    t.decimal  :customer_price,            :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  :billing_price,             :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  :full_price,                :precision => 8, :scale => 2, :default => 0.0, :null => false
    
    t.timestamps
  end   
  
  add_index "order_item", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "order_item", ["variant_id"], :name => "index_line_items_on_variant_id"  
    
  create_table "option_type", :force => true do |t|
    t.string "name", :limit => 100
    t.string "presentation", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end    
  
  create_table "option_value", :force => true do |t|
    t.integer "option_type_id"
    t.string "name"
    t.integer "position"
    t.string "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_values_variant", :id => false, :force => true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "option_values_variants", ["variant_id"], :name => "index_option_values_variants_on_variant_id"   
      
  create_table "payment", :force => true do |t|
    t.integer "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "amount", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer "creditcard_id"
    t.string "type"
  end      
  
  create_table "product", :force => true do |t|
    t.references :category
    t.references :productsource
    t.string "name", :default => "", :null => false
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "permalink"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string "meta_description"
    t.string "meta_keywords"
  end

  add_index "product", ["available_on"], :name => "index_products_on_available_on"
  add_index "product", ["deleted_at"], :name => "index_products_on_deleted_at"
  add_index "product", ["name"], :name => "index_products_on_name"
  add_index "product", ["permalink"], :name => "index_products_on_permalink"    
  
  create_table "product_option_type", :force => true do |t|
    t.integer "product_id"
    t.integer "option_type_id"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  
  create_table "state_event", :force => true do |t|
    t.integer "order_id"
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "previous_state"
  end    
  
  create_table "variant", :force => true do |t|
    t.integer "product_id"
    t.string "sku", :default => "", :null => false
    t.decimal "cost_price", :precision => 8, :scale => 2, :null => false
    t.decimal "billing_price", :precision => 8, :scale => 2, :null => false
    t.decimal "customer_price", :precision => 8, :scale => 2, :null => false
    t.decimal "full_price", :precision => 8, :scale => 2, :null => false
    t.datetime "deleted_at"
    t.boolean "is_master", :default => false
  end

  add_index "variant", ["product_id"], :name => "index_variants_on_product_id"     
end