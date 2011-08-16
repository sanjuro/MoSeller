class CreateMoClients < ActiveRecord::Migration
  
  def self.up
    create_table :clients, :options => "ENGINE=INNODB" do |t|
      t.references :client_types
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
    
    create_table :client_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :contacts, :options => "ENGINE=INODB" do |t|
      t.references :clients
      t.references :contact_typs
      t.string :contact_name
      t.string :contact_email
      t.string :contact_number

      t.timestamps
    end
    
    create_table :contact_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end

    create_table :locations, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.references :location_type
      t.string :addr1
      t.string :addr2
      t.string :addr3
      t.string :addr4
      t.string :addr5
      t.string :latitude
      t.string :longitude

      t.timestamps
    end  
  end
  
  create_table :location_type, :options => "ENGINE=INODB" do |t|
    t.string :title
  end

  def self.down
    
  end
end
