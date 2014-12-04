class AddAttachmentVocalSheetToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :vocal_sheet
    end
  end

  def self.down
    remove_attachment :songs, :vocal_sheet
  end
end
