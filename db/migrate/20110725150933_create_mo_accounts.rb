class CreateMoAccounts < ActiveRecord::Migration
  def self.up
    create_table :account_item, :options => "ENGINE=INODB" do |t|
      t.references :user
      t.references :account_item_type
      t.string :description
      t.decimal :credit,               :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :debit,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.string :account_status_id
      
      t.timestamps
    end
    
    create_table :account_item_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :invoice, :options => "ENGINE=INODB" do |t|
      t.references :user
      t.references :order
      t.decimal :margin,               :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :sub_total,            :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :tax,                  :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :total,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.datetime :date_paid
      t.string :email
      t.string "state"
      t.string :invoice_type_id
      
      t.timestamps
    end
    
    create_table :invoice_type, :options => "ENGINE=INODB" do |t|
      t.string :title
    end
    
    create_table :invoice_item, :options => "ENGINE=INODB" do |t|
      t.references :invoice
      t.text "description"
      t.decimal :total,                :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.integer :quantity,             :default => 0
      
      t.timestamps
    end
           
  end

  def self.down

  end
end
