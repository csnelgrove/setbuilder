class AddChildToUsers < ActiveRecord::Migration
  def change
    add_column :users, :child, :boolean, :default => false
  end
end
