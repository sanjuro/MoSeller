class PaymentTotalForOrders < ActiveRecord::Migration
  def self.up
    add_column :order, :payment_total, :decimal, :precision => 8, :scale => 2, :default => 0.0
  end

  def self.down
    remove_column :order, :payment_total
  end
end
