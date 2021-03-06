class CreateMoClients < ActiveRecord::Migration
  
  def self.up
    create_table :clients, :options => "ENGINE=INNODB" do |t|
      t.references :client_type
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
    
    create_table :client_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :contacts, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.references :contact_type
      t.string :contact_name
      t.string :contact_email
      t.string :contact_number

      t.timestamps
    end
    
    create_table :contact_types, :options => "ENGINE=INODB" do |t|
      t.string :title
    end

    create_table :locations, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.references :location_type
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :address4
      t.string :latitude
      t.string :longitude

      t.timestamps
    end  
  end
  
  create_table :location_types, :options => "ENGINE=INODB" do |t|
    t.string :title
  end

  def self.down
    
  end
end
