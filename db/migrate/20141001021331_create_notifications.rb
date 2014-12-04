class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :family_id
      t.string :content
      t.string :subject
      t.string :status_tag

      t.timestamps
    end
  end
end
