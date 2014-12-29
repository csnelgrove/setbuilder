class Song < ActiveRecord::Base
  attr_accessible :alt_title, :key, :song_title, :tempo, :chart, :vocal_sheet, :youtube_link, :ccli_id
  has_attached_file :chart, 
                    :default_url => "/images/:style/missing.png", 
                    :styles => { :thumb => ["120x120>", :jpg], :preview => ["800x1150>", :jpg] },
                    :convert_options => { :all => '-colorspace RGB -flatten -density 300 -quality 100' }
                    
                    
  has_attached_file :vocal_sheet, 
                    :default_url => "/images/:style/missing.png", 
                    :styles => { :thumb => ["120x120>", :jpg], :preview => ["800x1150>", :jpg] },                
                    :convert_options => { :all => '-colorspace RGB -flatten -density 300 -quality 100' }
                    
                    
  validates_attachment_content_type :chart, :content_type => "application/pdf"
  validates_attachment_content_type :vocal_sheet, :content_type => "application/pdf"
  has_many :setlist_items
  
   def self.search(search)
      
      if search.blank?
        find(:all, :order => "song_title")
      elsif search
         where('song_title LIKE ?', "%#{search}%").order('song_title ASC')
      else
        scoped
      end
    end
  
  
end
