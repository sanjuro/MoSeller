class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :user, :username, :string
  end

  def self.down
    remove_column :user, :username
  end
end
