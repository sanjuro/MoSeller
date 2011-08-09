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

ActiveRecord::Schema.define(:version => 20110725150941) do

  create_table "clients", :force => true do |t|
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

  add_index "clients", ["token"], :name => "token", :unique => true

  create_table "contacts", :force => true do |t|
    t.integer  "clients_id"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_number"
    t.integer  "contact_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["clients_id"], :name => "fk_contacts_clients"

  create_table "locations", :force => true do |t|
    t.integer  "client_id"
    t.string   "addr1"
    t.string   "addr2"
    t.string   "addr3"
    t.string   "addr4"
    t.string   "addr5"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "address_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["client_id"], :name => "fk_locations_clients"

  create_table "products", :force => true do |t|
    t.integer  "productsource_id"
    t.integer  "supplier_id"
    t.integer  "productsource_product_code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productsources", :force => true do |t|
    t.integer  "suppliers_id"
    t.integer  "source_type_id"
    t.string   "source_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productsources", ["suppliers_id"], :name => "fk_productsources_suppliers"

  create_table "saleitems", :force => true do |t|
    t.integer  "sale_id"
    t.integer  "product_id"
    t.string   "quantity"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "saleitems", ["sale_id"], :name => "fk_saleitems_sales"

  create_table "sales", :force => true do |t|
    t.integer  "client_id"
    t.string   "client_price"
    t.string   "margin"
    t.string   "vat"
    t.string   "total"
    t.string   "status_id"
    t.string   "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["client_id"], :name => "fk_sales_clients"

  create_table "suppliers", :force => true do |t|
    t.string   "registered_name"
    t.string   "contact_number"
    t.string   "email_address"
    t.string   "url"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suppliers", ["token"], :name => "token", :unique => true

end
