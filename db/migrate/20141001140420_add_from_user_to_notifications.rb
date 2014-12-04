class AddFromUserToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :from_user, :string
  end
end
