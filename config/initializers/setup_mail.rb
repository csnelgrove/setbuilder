ActionMailer::Base.smtp_settings = {  
  :address              => "smtp-relay.gmail.com",
  :port                 => 25,    
  :from => 'administrator@run.church',


}

ActionMailer::Base.default_url_options[:host] = "run.church"
