class AddccliIdToSongs < ActiveRecord::Migration
 def change
    add_column :songs, :ccli_id, :string
  end
end
