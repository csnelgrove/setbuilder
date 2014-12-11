class SetlistsController < ApplicationController
  # GET /setlists
  # GET /setlists.json
  def index
    @setlists = Setlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setlists }
    end
  end

  # GET /setlists/1
  # GET /setlists/1.json
  def show
    @setlist = Setlist.find(params[:id])
    @songs = @setlist.setlist_items.rank(:song_order).all
    
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @setlist }
    end
  end

  # GET /setlists/new
  # GET /setlists/new.json
  def new
    @setlist = Setlist.new
    @setlist.update_attribute(:service_date, Date.today - Date.today.wday + 7)
    @setlist.save!
    session[:setlist_id] = @setlist.id
   
    respond_to do |format|
       format.html { redirect_to :songs, notice: "Working On A New Set" }
      format.json { render json: @setlist }
    end
  end

  # GET /setlists/1/edit
  def edit
    @setlist = Setlist.find(params[:id])
    @setlist_items = @setlist.setlist_items.rank(:song_order).all
    
  end
  
  def change_active
   session[:setlist_id] = params[:id]
   
   respond_to do |format|
    format.html { redirect_to :songs, notice: "Changed Active Setlist" }
  end
  end
  
  def publish_new
    @setlist = Setlist.find(params[:setlist][:id])
    @setlist_items = @setlist.setlist_items.rank(:song_order).all
    
    respond_to do |format|
      if @setlist.update_attributes(params[:setlist])
        @setlist.update_attribute(:published, true)
        SetlistsMailer.send_new_setlist(current_user, @setlist, @setlist_items).deliver       
        format.html { redirect_to :root, :notice => 'Setlist Published' }
        format.json { head :ok }
      else
           format.html { redirect_to :root, :notice => 'Setlist Error Published' }
       # format.html { render :action => "edit" }
        #format.json { render :json => @personnel.errors, :status => :unprocessable_entity }
      end
    end 
  end




def publish
    @setlist = Setlist.find(params[:id])


 end



  # POST /setlists
  # POST /setlists.json
  def create
    session[:setlist_params].deep_merge!(params[:setlist]) if params[:setlist]
    @setlist = Setlist.new(params[:setlist])

    respond_to do |format|
      if @setlist.save
        format.html { redirect_to @setlist, notice: 'Setlist was successfully created.' }
        format.json { render json: @setlist, status: :created, location: @setlist }
      else
        format.html { render action: "new" }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /setlists/1
  # PUT /setlists/1.json
  def update
    @setlist = Setlist.find(params[:id])

    respond_to do |format|
      if @setlist.update_attributes(params[:setlist])
        format.html { redirect_to @setlist, notice: 'Setlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /setlists/1
  # DELETE /setlists/1.json
  def destroy
    @setlist = Setlist.find(params[:id])
    @setlist.destroy

    respond_to do |format|
      format.html { redirect_to setlists_url }
      format.json { head :no_content }
    end
  end
end
