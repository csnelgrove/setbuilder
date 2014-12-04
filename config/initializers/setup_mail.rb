ActionMailer::Base.smtp_settings = {  
  :address              => "localhost",  
  :port                 => 25,    



}

ActionMailer::Base.default_url_options[:host] = "run.church"
