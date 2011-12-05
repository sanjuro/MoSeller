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

ActiveRecord::Schema.define(:version => 20111203081220) do

  create_table "account_item", :force => true do |t|
    t.integer  "user_id"
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

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_user", :force => true do |t|
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
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_user", ["email"], :name => "index_admin_user_on_email", :unique => true
  add_index "admin_user", ["reset_password_token"], :name => "index_admin_user_on_reset_password_token", :unique => true

  create_table "asset", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type",           :limit => 50
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.integer  "attachment_size"
    t.integer  "position"
    t.string   "type",                    :limit => 75
    t.datetime "attachment_updated_at"
    t.integer  "attachment_width"
    t.integer  "attachment_height"
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

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

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

  create_table "gateway", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.string   "server",      :default => "test"
    t.boolean  "test_mode",   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_level", :force => true do |t|
    t.integer  "product_source_id"
    t.string   "clazz"
    t.decimal  "stock_level",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice", :force => true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.decimal  "margin",          :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "sub_total",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "tax",             :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "total",           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "date_paid"
    t.string   "email"
    t.string   "state"
    t.string   "invoice_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_item", :force => true do |t|
    t.integer  "invoice_id"
    t.text     "description"
    t.decimal  "total",       :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer  "quantity",                                  :default => 0
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
    t.decimal  "payment_total",                  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "customer_total",                 :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "billing_total",                  :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "full_total",                     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.string   "email",            :limit => 30
    t.string   "mobile_number",    :limit => 15
    t.string   "customer_name",    :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
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

  create_table "package", :force => true do |t|
    t.integer  "order_item_id"
    t.string   "payload"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clazz",         :default => "AirtimePackage"
    t.boolean  "is_used",       :default => true
  end

  create_table "payment", :force => true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.string   "state"
    t.integer  "order_id"
    t.integer  "payment_method_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",            :precision => 8, :scale => 2, :default => 0.0, :null => false
  end

  create_table "payment_method", :force => true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "display_on"
    t.text     "description"
    t.boolean  "active",      :default => true
    t.string   "environment", :default => "development"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product", :force => true do |t|
    t.integer  "category_id"
    t.integer  "product_source_id"
    t.string   "name",                                            :default => "", :null => false
    t.text     "description"
    t.decimal  "cost_price",        :precision => 8, :scale => 2
    t.decimal  "customer_price",    :precision => 8, :scale => 2,                 :null => false
    t.string   "permalink"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "name"
    t.string   "description"
    t.string   "clazz"
    t.datetime "deleted_at"
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
    t.string   "next_state"
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
    t.string   "email",                                                               :default => "",  :null => false
    t.string   "encrypted_password",     :limit => 128,                               :default => "",  :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "cap_left",                              :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.decimal  "cap_limit",                             :precision => 8, :scale => 2, :default => 0.0, :null => false
  end

  add_index "user", ["email"], :name => "index_user_on_email", :unique => true
  add_index "user", ["reset_password_token"], :name => "index_user_on_reset_password_token", :unique => true

  create_table "variant", :force => true do |t|
    t.integer  "product_id"
    t.string   "sku",                                          :default => "",    :null => false
    t.decimal  "cost_price",     :precision => 8, :scale => 2
    t.decimal  "customer_price", :precision => 8, :scale => 2
    t.decimal  "full_price",     :precision => 8, :scale => 2
    t.datetime "deleted_at"
    t.boolean  "is_master",                                    :default => false
  end

  add_index "variant", ["product_id"], :name => "index_variants_on_product_id"

end
