class AddHasMultitrackToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :has_multitrack, :boolean
  end
end
