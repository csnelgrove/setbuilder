class UserSessionsController  < ApplicationController    
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default :root
    else
      flash[:notice] = "Login Failed, Check The Caps Yo!"
      redirect_back_or_default :root
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default :root
  end
end