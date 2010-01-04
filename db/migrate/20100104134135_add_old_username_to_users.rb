class AddOldUsernameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :old_username, :string
  end

  def self.down
    remove_column :users, :old_username
  end
end
