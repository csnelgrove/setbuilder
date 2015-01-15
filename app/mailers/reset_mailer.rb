class ResetMailer < ActionMailer::Base


  def deliver_password_reset_instructions(user)
   mail(:to => user.email, :subject => "Password Reset Instructions", :from => "setlists@run.church")

  end


end
