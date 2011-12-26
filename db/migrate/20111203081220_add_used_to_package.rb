class AddUsedToPackage < ActiveRecord::Migration
  def self.up
    add_column :package, :is_used, :boolean, :default => false
  end

  def self.down
    remove_column :package, :is_used
  end  
end
# ALTER TABLE account_item ADD description varchar(80) after account_item_type_id;
