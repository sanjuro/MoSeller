class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients, :options => "ENGINE=INNODB" do |t|
      t.string :unique_id
      t.string :registered_name
      t.string :email_address
      t.integer :tax
      t.string :telephone
      t.string :url
      t.string :token
      
      t.timestamps
    end
    #add a unique token
    execute <<-SQL
      ALTER TABLE `clients` ADD UNIQUE (
       `token`
       )
    SQL
  end

  def self.down
    drop_table :clients
  end
end
