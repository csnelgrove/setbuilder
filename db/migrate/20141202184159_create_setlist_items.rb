class CreateSetlistItems < ActiveRecord::Migration
  def change
    create_table :setlist_items do |t|
      t.references :song
      t.references :setlist
      t.integer :song_order

      t.timestamps
    end
    add_index :setlist_items, :song_id
    add_index :setlist_items, :setlist_id
  end
end
