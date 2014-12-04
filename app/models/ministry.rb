class Ministry < ActiveRecord::Base
  attr_accessible :children, :description, :name, :worship
  has_many :users, :through => :role_users
  
  
  
  
  
end
