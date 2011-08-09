ActiveRecord::Schema.define(:version => 0) do
  create_table :productsource, :force => true do |t|
    t.integer  :supplier_id
    t.integer  :source_type_id
    t.string   :source_name
  end
  create_table :supplier, :force => true do |t|
    t.string   :registered_name
    t.string   :email_address
    t.string   :url
  end
end