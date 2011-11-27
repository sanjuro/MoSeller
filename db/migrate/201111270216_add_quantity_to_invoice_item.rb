class QuantityForInvoiceItems < ActiveRecord::Migration
  def self.up
    add_column :invoice_item, :quantity, :default => 0
  end

  def self.down
    remove_column :invoice_item, :quantity
  end
end