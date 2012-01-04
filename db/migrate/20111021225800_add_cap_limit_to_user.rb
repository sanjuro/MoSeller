class AddCapLimitToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :cap_left, :decimal, :precision => 8, :scale => 2, :default => 0.0, :null => false
    add_column :users, :cap_limit, :decimal, :precision => 8, :scale => 2, :default => 0.0, :null => false
  end

  def self.down
    remove_column :users, :cap_left
    remove_column :users, :cap_limit
  end  
end
# ALTER TABLE users ADD cap_left DECIMAL(8,2);
# ALTER TABLE users ADD cap_limit DECIMAL(8,2);