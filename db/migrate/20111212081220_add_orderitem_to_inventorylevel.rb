class AddOrderitemToInventorlevel < ActiveRecord::Migration
  def self.up
    add_column :inventory_level, :order_item_id, :integer
    add_column :inventory_level, :is_current, :boolean, :default => false
  end

  def self.down
    remove_column :inventory_level, :order_item_id
    remove_column :inventory_level, :is_current
  end  
end
# ALTER TABLE inventory_level ADD is_current tinyint(1) DEFAULT '0' AFTER stock_level;
# ALTER TABLE inventory_level ADD order_item_id int(1) AFTER is_current;