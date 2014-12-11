class ApplicationController < ActionController::Base
  protect_from_forgery 

  #filter_parameter_logging :password, :password_confirmation # there are underscores :-|

  helper_method :current_user_session, :current_user, :my_notifications, :my_new_notifications, :children, :current_setlist, :thisweek_setlist
  before_filter :current_setlist 
 
  private
      def current_setlist
        if current_user
        if current_user.roles.where(:name =>"worship_leader").present?
        @setlist = Setlist.where(id: session[:setlist_id]).first 
        @setlist = Setlist.create(:service_date => Date.today - Date.today.wday + 7) if @setlist.nil?
        session[:setlist_id] = @setlist.id
        @setlist
        end
        end
      end
      
      def new_setlist
        current_setlist.save!
        Setlist.where(id: session[:setlist_id]).first.destroy!
        @setlist = Setlist.where(id: session[:setlist_id]).first 
        @setlist = Setlist.create if @setlist.nil?
        session[:setlist_id] = @setlist.id
        @setlist
        
      end
 
 
      def thisweek_setlist
      @setlist = Setlist.where(:service_date => Date.today - Date.today.wday + 7, :published => true).last
      @setlist
        
      end
      
      
      
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
      def my_notifications
     
        return current_user.notifications

      end
      
    def my_new_notifications
      return current_user.notifications.where("status_tag = ?", "New")  
    
    end
    
   
    
    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to :root
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end



    
    
end
