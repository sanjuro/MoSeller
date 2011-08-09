class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts, :options => "ENGINE=INODB" do |t|
      t.references :clients
      t.string :contact_name
      t.string :contact_email
      t.string :contact_number
      t.integer :contact_type_id

      t.timestamps
    end
    #add a foreign key
    execute <<-SQL
      ALTER TABLE contacts
        ADD CONSTRAINT fk_contacts_clients
        FOREIGN KEY (clients_id)
        REFERENCES clients(id)
    SQL
  end

  def self.down
    drop_table :contacts
  end
end
