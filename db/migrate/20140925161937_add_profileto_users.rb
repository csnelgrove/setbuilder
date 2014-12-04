class AddProfiletoUsers < ActiveRecord::Migration
  def up
    add_column :users, :profile_id, :string
  end

  def down
  end
end
