class SongsController < ApplicationController
  # GET /songs
  # GET /songs.json


  def index
     require 'will_paginate/array'
        @songs = Song.search(params[:search], params[:page]).paginate(page: params[:page], per_page: 15)
     if current_user.roles.where(:name =>"worship_leader").present?
    @setlist_item = current_setlist.setlist_items.new
     end

  end

  # GET /songs/1
  # GET /songs/1.json
  def show

    if current_user
    @song = Song.find(params[:id])
      if current_user.roles.where(:name =>"worship_leader").present?
    @setlist_item = current_setlist.setlist_items.new
       end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
    else
      redirect_to :root, notice: 'Log In Fool...'
      end

  end
  
  def song_sketch
    @song = Song.find(params[:id])
      if current_user.roles.where(:name =>"worship_leader").present?
    @setlist_item = current_setlist.setlist_items.new
       end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @song }
    end
  end


  # GET /songs/new
  # GET /songs/new.json
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.find(params[:id])
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: 'Song was successfully created.' }
        format.json { render json: @song, status: :created, location: @song }
      else
        format.html { render action: "new" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.json
  def update
    @song = Song.find(params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end


    def song_list
       @songs = Song.all
       respond_to do |format|
           format.json { render json: @songs }
       end
    end


end
