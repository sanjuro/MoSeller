class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products, :options => "ENGINE=INODB" do |t|
      t.references :productsource
      t.references :supplier
      t.integer :productsource_product_code
      t.string :description
      
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
