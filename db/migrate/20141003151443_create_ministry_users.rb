class CreateMinistryUsers < ActiveRecord::Migration
  def change
    create_table :ministry_users do |t|
      t.integer :user_id
      t.integer :ministry_id
      t.string :ministry_role

      t.timestamps
    end
  end
end
