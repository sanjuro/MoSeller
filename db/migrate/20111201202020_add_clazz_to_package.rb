class AddClazzToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :clazz, :string, :default => 'AirtimePackage'
  end

  def self.down
    remove_column :packages, :clazz
  end  
end
# ALTER TABLE package ADD clazz varchar(80);
# UPDATE packages SET clazz = "AirtimePackage" WHERE clazz IS NULL;