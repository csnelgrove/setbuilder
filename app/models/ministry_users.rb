class MinistryUsers < ActiveRecord::Base
  attr_accessible :ministry_id, :ministry_role, :user_id
end
