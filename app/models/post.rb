class Post < ActiveRecord::Base
  attr_accessible :message, :publised, :user_id
end
