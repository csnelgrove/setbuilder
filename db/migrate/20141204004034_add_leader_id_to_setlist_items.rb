class AddLeaderIdToSetlistItems < ActiveRecord::Migration
  def change
    add_column :setlist_items, :leader_id, :string
    
  end
end
