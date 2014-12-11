class FixColumnNamePosts < ActiveRecord::Migration
 def change
    rename_column :posts, :publised, :published
  end
end
