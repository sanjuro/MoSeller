# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110824084915) do

  create_table "account_item", :force => true do |t|
    t.integer  "client_id"
    t.integer  "account_item_type_id"
    t.decimal  "credit",               :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "debit",                :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string   "account_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_item_type", :force => true do |t|
    t.string "title"
  end

  create_table "category", :force => true do |t|
    t.string "title"
  end

  create_table "client", :force => true do |t|
    t.integer  "client_type_id"
    t.string   "unique_id"
    t.string   "registered_name"
    t.string   "email_address"
    t.integer  "tax"
    t.string   "telephone"
    t.string   "url"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client", ["token"], :name => "token", :unique => true

  create_table "client_type", :force => true do |t|
    t.string "title"
  end

  create_table "contact", :force => true do |t|
    t.integer  "client_id"
    t.integer  "contact_type_id"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_type", :force => true do |t|
    t.string "title"
  end

  create_table "invoice", :force => true do |t|
    t.integer  "client_id"
    t.integer  "order_id"
    t.decimal  "margin",            :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "subtotal",          :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",               :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",             :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "date_paid"
    t.string   "invoice_status_id"
    t.string   "invoice_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_item", :force => true do |t|
    t.integer  "invoice_id"
    t.text     "description"
    t.decimal  "total",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_type", :force => true do |t|
    t.string "title"
  end

  create_table "location", :force => true do |t|
    t.integer  "client_id"
    t.integer  "location_type_id"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "address4"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_type", :force => true do |t|
    t.string "title"
  end

  create_table "option_type", :force => true do |t|
    t.string   "name",         :limit => 100
    t.string   "presentation", :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_value", :force => true do |t|
    t.integer  "option_type_id"
    t.string   "name"
    t.integer  "position"
    t.string   "presentation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "option_value_variant", :id => false, :force => true do |t|
    t.integer "variant_id"
    t.integer "option_value_id"
  end

  add_index "option_value_variant", ["variant_id"], :name => "index_option_values_variants_on_variant_id"

  create_table "order", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "client_id"
    t.integer  "user_id"
    t.string   "number",           :limit => 15
    t.decimal  "item_total",                     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "customer_total",                 :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "billing_total",                  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "full_total",                     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "token"
    t.decimal  "adjustment_total",               :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "credit_total",                   :precision => 8, :scale => 2, :default => 0.0, :null => false
  end

  add_index "order", ["number"], :name => "index_orders_on_number"

  create_table "order_item", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.decimal  "customer_price", :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "billing_price",  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "full_price",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_item", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "order_item", ["variant_id"], :name => "index_line_items_on_variant_id"

  create_table "payment", :force => true do |t|
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",        :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "creditcard_id"
    t.string   "type"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product", :force => true do |t|
    t.integer  "category_id"
    t.integer  "product_source_id"
    t.string   "name",              :default => "", :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "meta_description"
    t.string   "meta_keywords"
  end

  add_index "product", ["available_on"], :name => "index_products_on_available_on"
  add_index "product", ["deleted_at"], :name => "index_products_on_deleted_at"
  add_index "product", ["name"], :name => "index_products_on_name"
  add_index "product", ["permalink"], :name => "index_products_on_permalink"

  create_table "product_option_type", :force => true do |t|
    t.integer  "product_id"
    t.integer  "option_type_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_source", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "product_gateway_id"
    t.string   "source_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "state_event", :force => true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "previous_state"
  end

  create_table "supplier", :force => true do |t|
    t.string   "registered_name"
    t.string   "contact_number"
    t.string   "email_address"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", :force => true do |t|
    t.integer  "client_id"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user", ["email"], :name => "index_user_on_email", :unique => true
  add_index "user", ["reset_password_token"], :name => "index_user_on_reset_password_token", :unique => true

  create_table "variant", :force => true do |t|
    t.integer  "product_id"
    t.string   "sku",                                          :default => "",    :null => false
    t.decimal  "cost_price",     :precision => 8, :scale => 2,                    :null => false
    t.decimal  "billing_price",  :precision => 8, :scale => 2,                    :null => false
    t.decimal  "customer_price", :precision => 8, :scale => 2,                    :null => false
    t.decimal  "full_price",     :precision => 8, :scale => 2,                    :null => false
    t.datetime "deleted_at"
    t.boolean  "is_master",                                    :default => false
  end

  add_index "variant", ["product_id"], :name => "index_variants_on_product_id"

end
