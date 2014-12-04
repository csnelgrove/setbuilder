class UsersController < ApplicationController    
before_filter :require_user
 respond_to :html, :json
 
  def user_params
    params.require(:user).permit(:avatar)
  end
 
  def index
  if current_user.roles.where(:name => 'admin').present?
    @users = User.where('child = ?', false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  else
    flash[:notice] = "Hey Now! No Perms for That"
    redirect_to :root
  end
  end  


 def manage_family
   if current_user
     @list_family_memberships = current_user.families
     @current_family = current_user.family_members.map(&:id) 
     @current_family.push(current_user.id)
     @available_users =  User.where('id NOT IN (?)', @current_family ).search(params[:search])
     @pending_requests = Family.where(:family_member_id => current_user.id).where(:verified => false)
     respond_to do |format|
       format.html # index.html.erb
       format.json { render json: @users }
     end
   else
     flash[:notice] = "Hey Now! No Perms for That"
     redirect_to :root
   end
 end
 
 def family_search
   @current_family = current_user.family_members.map(&:id) 
   @current_family.push(current_user.id)
   @available_users =  User.where('id NOT IN (?)', @current_family ).search(params[:search])
 end

 


  def new
    @user = User.new

   
  end
  
  def add_child
    @user = User.new

  end
  
  

  def create
 if params[:commit] == 'child'
    @user = User.new(params[:user])
    if @user.save!(:validate => false)
      @parentjoin = Family.create(:user_id => current_user.id, :family_member_id => @user.id, :relationship => "Child", :verified => true)
      @childjoin = Family.create(:user_id => @user.id, :family_member_id => current_user.id, :relationship => "Parent", :verified => true)
      @parentjoin.save!
      @childjoin.save!
      
      @spouse = current_user.family_members.where("relationship = ? OR relationship = ?","Husband", "Wife").last
      if @spouse
      @spouseparentjoin = Family.create(:user_id => @spouse.id, :family_member_id => @user.id, :relationship => "Child", :verified => true)
      @spousehildjoin = Family.create(:user_id => @user.id, :family_member_id => @spouse.id, :relationship => "Parent", :verified => true)
        
      end
      
        
      
      
      flash[:notice] = "Child Created"
      redirect_to :back
    else
      flash[:warn] = "Ooooops, We Have Issues"
      render :action => :new
    end
  else 
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User Created"
      redirect_to users_url
    else
      flash[:warn] = "Ooooops, We Have Issues"
      render :action => :new
    end
  end
  
  end

  def show
    @user = current_user
  end

  def edit
    if current_user.roles.where(:name => 'admin').present?
    @user = User.find(params[:id])
    @profile = @user.profile
    @families = @user.families
    
  else
    flash[:notice] = "Hey Now! No Perms for That"
    redirect_to :root
  end
  end
  
  
  def profile
    if current_user
    @user = current_user
    @profile = @user.profile
    
  else

    redirect_to :root
  end
  end
  

  def update
    
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to users_url
    else
      render :action => :edit
    end
  end
  
  def destroy
     @user = User.find(params[:id])
     @user.destroy

     respond_to do |format|
       format.html { redirect_to users_url }
       format.json { head :ok }
     end
   end
   
  
end