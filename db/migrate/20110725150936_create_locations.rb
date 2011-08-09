class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations, :options => "ENGINE=INODB" do |t|
      t.references :client
      t.string :addr1
      t.string :addr2
      t.string :addr3
      t.string :addr4
      t.string :addr5
      t.string :latitude
      t.string :longitude
      t.integer :address_type_id

      t.timestamps
    end
    #add a foreign key
    execute <<-SQL
      ALTER TABLE locations
        ADD CONSTRAINT fk_locations_clients
        FOREIGN KEY (client_id)
        REFERENCES clients(id)
    SQL
  end

  def self.down
    drop_table :locations
  end
end
