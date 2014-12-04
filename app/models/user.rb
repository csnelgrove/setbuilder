class User < ActiveRecord::Base
  
    attr_accessible :password, :password_confirmation, :email, :name, :time_zone, :role_ids, :profile_attributes, :avatar, :active, :birthday, :child
  acts_as_authentic do |c|
    c.login_field = 'email'
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    end 
    
    def active? 
      self.active 
    end

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" } , :default_url =>  "child_avatar.png"
    

    
    
  
  
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    
    
    attr_accessible :family_member_id
    
      has_many :role_users
      has_many :roles, :through => :role_users
      has_many :ministries, :through => :ministry_users
      has_one :profile
      has_many :families
      has_many :family_members, :through => :families
      has_many :notifications
      accepts_nested_attributes_for :profile, :allow_destroy => true
      after_create :build_profile
      

      def self.search(search)
        if search.blank?
          where('name LIKE ?', "%RANDOMBLKAJSLKJJKSLDFJKLLSDFJ%")
        elsif search
           where('name LIKE ?', "%#{search}%")
          
        else
          scoped
        end
      end

def build_profile
    Profile.create(user_id: self) 
  end




end
