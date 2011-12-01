class AddClazzToPackage < ActiveRecord::Migration
  def self.up
    add_column :package, :clazz, :string
  end

  def self.down
    remove_column :package, :clazz
  end  
end
# ALTER TABLE package ADD clazz varchar(80);
# UPDATE package SET clazz = "AirtimePackage" WHERE clazz IS NULL 