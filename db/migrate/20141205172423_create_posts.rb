class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :message
      t.boolean :publised

      t.timestamps
    end
  end
end
