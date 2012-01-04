class AddUsedToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :is_used, :boolean, :default => false
  end

  def self.down
    remove_column :packages, :is_used
  end  
end
# ALTER TABLE account_items ADD description varchar(80) after account_item_type_id;
