class DeviseCreateAdminUser < ActiveRecord::Migration
  def self.up
    create_table(:admin_user) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      t.string :username

      t.timestamps
    end

    # Create a default user
    AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password', :username => 'sanjuro')

    add_index :admin_user, :email,                :unique => true
    add_index :admin_user, :reset_password_token, :unique => true
    # add_index :admin_user, :confirmation_token,   :unique => true
    # add_index :admin_user, :unlock_token,         :unique => true
    # add_index :admin_user, :authentication_token, :unique => true
  end

  def self.down
    drop_table :admin_user
  end
end
