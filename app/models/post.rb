class Post < ActiveRecord::Base
  attr_accessible :message, :publised, :user_id
    belongs_to :user


end
