class AddCapLimitToUser < ActiveRecord::Migration
  def self.up
    add_column :user, :cap_left, :decimal, :precision => 8, :scale => 2, :default => 0.0, :null => false
    add_column :user, :cap_limit, :decimal, :precision => 8, :scale => 2, :default => 0.0, :null => false
  end

  def self.down
    remove_column :user, :cap_left
    remove_column :user, :cap_limit
  end  
end
# ALTER TABLE user ADD cap_left DECIMAL(8,2);
# ALTER TABLE user ADD cap_limit DECIMAL(8,2);