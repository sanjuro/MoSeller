class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers, :options => "ENGINE=INODB" do |t|
      t.string   :registered_name
      t.string   :contact_number
      t.string   :email_address
      t.string   :url
      t.string   :token
      
      t.timestamps
    end
    #add a unique token
    execute <<-SQL
      ALTER TABLE `suppliers` ADD UNIQUE (
       `token`
       )
    SQL
  end

  def self.down
    drop_table :suppliers
  end
end
