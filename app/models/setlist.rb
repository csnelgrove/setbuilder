class Setlist < ActiveRecord::Base
  attr_accessible :published, :service_date, :user_id
  has_many :setlist_items
end
