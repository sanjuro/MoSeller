class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:user) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable
      t.string :username
      t.string :first_name
      t.string :last_name
      t.boolean :active, :default => true
      t.string :role, :default => 'user'
      t.references :client


      t.timestamps
    end

    add_index :user, :email,                :unique => true
    add_index :user, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
    
    
    create_table "role", :options => "ENGINE=INODB", :force => true do |t|
      t.string "name"
    end

    create_table "roles_user", :id => false, :options => "ENGINE=INODB", :force => true do |t|
      t.integer "role_id"
      t.integer "user_id"
    end

    add_index "roles_user", ["role_id"], :name => "index_role_user_on_role_id"
    add_index "roles_user", ["user_id"], :name => "index_role_user_on_user_id"
      
  end

  def self.down
    drop_table :user
  end
end
