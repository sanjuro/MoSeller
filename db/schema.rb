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

ActiveRecord::Schema.define(:version => 20110815183942) do

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
    t.string   "addr1"
    t.string   "addr2"
    t.string   "addr3"
    t.string   "addr4"
    t.string   "addr5"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_type", :force => true do |t|
    t.string "title"
  end

  create_table "order", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "client_id"
    t.decimal  "margin",      :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",         :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_item", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.decimal  "price",      :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product", :force => true do |t|
    t.integer  "productsource_id"
    t.integer  "supplier_id"
    t.integer  "productsource_product_code"
    t.string   "name",                       :default => "", :null => false
    t.text     "description"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_category", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productsource", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "source_type_id"
    t.string   "source_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role", :force => true do |t|
    t.string "name"
  end

  create_table "roles_user", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_user", ["role_id"], :name => "index_role_user_on_role_id"
  add_index "roles_user", ["user_id"], :name => "index_role_user_on_user_id"

  create_table "sale", :force => true do |t|
    t.integer  "client_id"
    t.decimal  "margin",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",        :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",      :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string   "status_id"
    t.string   "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_item", :force => true do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "variant_id"
    t.integer  "quantity"
    t.decimal  "price",      :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "source_type", :force => true do |t|
    t.string "title"
  end

  create_table "state_events", :force => true do |t|
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
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", :force => true do |t|
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",     :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active",                                :default => true
    t.string   "role",                                  :default => "user"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user", ["email"], :name => "index_user_on_email", :unique => true
  add_index "user", ["reset_password_token"], :name => "index_user_on_reset_password_token", :unique => true

end
