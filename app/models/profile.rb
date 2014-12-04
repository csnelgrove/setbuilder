class Profile < ActiveRecord::Base
  attr_accessible :city, :nickname, :state, :street_1, :street_2, :user_id, :zip_code
  belongs_to :user
  
  
end
