class CreateProductsources < ActiveRecord::Migration
  def self.up
    create_table :productsources, :options => "ENGINE=INODB" do |t|
      t.references :suppliers
      t.integer :source_type_id
      t.string :source_name
      
      t.timestamps
    end
    #add a foreign key
    execute <<-SQL
      ALTER TABLE productsources
        ADD CONSTRAINT fk_productsources_suppliers
        FOREIGN KEY (suppliers_id)
        REFERENCES suppliers(id)
    SQL
  end

  def self.down
    drop_table :productsources
  end
end
