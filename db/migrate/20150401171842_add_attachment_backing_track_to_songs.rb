class AddAttachmentBackingTrackToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :backing_track
    end
  end

  def self.down
    remove_attachment :songs, :backing_track
  end
end
