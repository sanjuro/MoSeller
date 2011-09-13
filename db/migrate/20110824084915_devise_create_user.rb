class DeviseCreateUser < ActiveRecord::Migration
  def self.up
    create_table(:user) do |t|
      t.references :client      
      
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.string :name

      t.timestamps
    end

    add_index :user, :email,                :unique => true
    add_index :user, :reset_password_token, :unique => true
    # add_index :user, :confirmation_token,   :unique => true
    # add_index :user, :unlock_token,         :unique => true
    # add_index :user, :authentication_token, :unique => true
    
    create_table(:admin_user) do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :user
    drop_table :admin_user
  end
end
