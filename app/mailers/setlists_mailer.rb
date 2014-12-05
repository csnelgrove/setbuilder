class SetlistsMailer < ActionMailer::Base

def send_new_setlist(current_user, setlist, setlist_items)
  @user = current_user
  @setlist = setlist
  @setlist_items = setlist_items
  
  @recipiants = User.all
  
  
  @setlist_items.each do |item|
    attachments["#{item.song.song_title}" + '.pdf'] = open("https://localhost#{item.song.chart.url}").read
  end
  
  mail(:to => @recipiants.map(&:email), :subject => "Setlist for " "#{setlist.service_date}", :from => "setlists@run.church")



end  
  
  
  
end