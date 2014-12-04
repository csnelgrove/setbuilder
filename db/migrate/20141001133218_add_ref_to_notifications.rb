class AddRefToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :ref, :string
  end
end
