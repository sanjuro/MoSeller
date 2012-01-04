class AddOrderitemToInventorlevel < ActiveRecord::Migration
  def self.up
    add_column :inventory_levels, :order_item_id, :integer
    add_column :inventory_levels, :is_current, :boolean, :default => false
  end

  def self.down
    remove_column :inventory_levels, :order_item_id
    remove_column :inventory_levels, :is_current
  end  
end
# ALTER TABLE inventory_levels ADD is_current tinyint(1) DEFAULT '0' AFTER stock_level;
# ALTER TABLE inventory_levels ADD order_item_id int(1) AFTER is_current;
# UPDATE inventory_levels is_current = 1 where id = 1 LIMIT 1;