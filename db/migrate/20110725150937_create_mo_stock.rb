class CreateMoStock < ActiveRecord::Migration
  def self.up
    create_table :inventory_levels, :options => "ENGINE=INODB" do |t|
      t.references :product_source
      t.string :clazz
      t.decimal :stock_level, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.datetime :deleted_at
      
      t.timestamps
    end
  end 
  
  def self.down
  
  end
end 