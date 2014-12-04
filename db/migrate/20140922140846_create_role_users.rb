class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.string :user_id
      t.string :role_id

      t.timestamps
    end
  end
end
