ActiveRecord::Schema.define(:version => 0) do
  create_table :sale, :force => true do |t|
    t.string :client_id
    t.string :client_price
    t.string :margin
    t.integer :vat
    t.string :total
    t.string :discount
    t.datetime :created_at
  end
  create_table :sale_item, :force => true do |t|
    t.integer :sale_id
    t.integer :product_id
    t.string :price
    t.string :quantity
    t.datetime :created_at
  end
  create_table :product, :force => true do |t|
    t.integer :productsource_id
    t.integer :productsource_product_id
    t.string :description
  end
end