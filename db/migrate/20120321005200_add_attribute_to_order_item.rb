class AddAttributeToOrderItem < ActiveRecord::Migration
  def self.up
    add_column :order_items, :attribute_note, :string, :default => ''
  end

  def self.down
    remove_column :order_items, :attribute_note
  end  
end
# ALTER TABLE order_items ADD attribute_note varchar(200) DEFAULT '0' AFTER full_price;