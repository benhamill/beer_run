class AddUserNotificationSettings < ActiveRecord::Migration
  def up
    add_column :users, :notification_frequency, :string, :default => 'never'
    add_column :users, :notify_on, :integer, :default => 4
  end

  def down
    remove_column :users, :notification_frequency
    remove_column :users, :notify_on
  end
end
