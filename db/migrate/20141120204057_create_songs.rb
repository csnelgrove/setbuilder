class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_title
      t.string :alt_title
      t.string :key
      t.integer :tempo

      t.timestamps
    end
  end
end
