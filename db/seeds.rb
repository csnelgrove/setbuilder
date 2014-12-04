# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





Role.create!(:name => 'admin', :description => 'Super Admin')
Role.create!(:name => 'worship_leader', :description => 'Worship Leader')
Role.create!(:name => 'musician', :description => 'Musicisan')
Role.create!(:name => 'vocalist', :description => 'Vocalist')
Role.create!(:name => 'av', :description => 'Audio Visual Team')



def myroles()
 Role.find(:all, :conditions => ["name != ?", "stakeholder" ]) 
end
u = User.create(:password => 'password', :password_confirmation => 'password', :email => 'admin@default.com', :name => 'Default Admin', :active => true)
myroles.each { |role| u.roles << role }
u.save(:validate => false)
