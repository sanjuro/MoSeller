class AddUsedToPackage < ActiveRecord::Migration
  def self.up
    add_column :package, :is_used, :boolean, :default => true
  end

  def self.down
    remove_column :package, :is_used
  end  
end
# ALTER TABLE package ADD is_used tinyint(1) DEFAULT '1';
