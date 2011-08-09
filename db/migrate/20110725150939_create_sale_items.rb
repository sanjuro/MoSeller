class CreateSaleItems < ActiveRecord::Migration
  def self.up
    create_table :saleitems, :options => "ENGINE=INODB" do |t|
      t.references :sale
      t.references :product
      t.string :quantity
      t.string :price
      
      t.timestamps
    end
    #add a foreign key
    execute <<-SQL
      ALTER TABLE saleitems
        ADD CONSTRAINT fk_saleitems_sales
        FOREIGN KEY (sale_id)
        REFERENCES sales(id)
    SQL
  end

  def self.down
    drop_table :saleitems
  end
end
