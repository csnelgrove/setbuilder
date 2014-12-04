class Notification < ActiveRecord::Base
  attr_accessible :content, :family_id, :status_tag, :subject, :user_id, :ref, :from_user
  belongs_to :user
  
  
end
