class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.string :client_price
      t.string :margin
      t.string :vat
      t.string :total
      t.string :status_id
      t.string :type_id
      
      t.timestamps
    end
    #add a foreign key
    execute <<-SQL
      ALTER TABLE sales
        ADD CONSTRAINT fk_sales_clients
        FOREIGN KEY (client_id)
        REFERENCES clients(id)
    SQL
  end

  def self.down
    drop_table :sales
  end
end
