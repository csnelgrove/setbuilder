class SetlistItem < ActiveRecord::Base
    attr_accessible :song_order
    attr_accessible :song_id
    attr_accessible :id
    attr_accessible :leader_id
    belongs_to :song
    belongs_to :setlist

  
  include RankedModel
   ranks :song_order
  
end
