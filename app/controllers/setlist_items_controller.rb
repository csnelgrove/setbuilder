class SetlistItemsController < ApplicationController
  def create
      @setlist = current_setlist
      @setlist_item = @setlist.setlist_items.new(params[:setlist_item])
      @setlist.save
      session[:setlist_id] = @setlist.id

      respond_to do |format|
          if @setlist.save
            format.js { redirect_to :root, notice: @setlist_item.song.song_title + " Removed from Set List" }
            format.html { redirect_to :root, notice: @setlist_item.song.song_title + " Removed from Set List" }
          else
            format.js { redirect_to :root, notice: @setlist_item.song.song_title + " Removed from Set List" }
            format.html { redirect_to :root, notice: @setlist_item.song.song_title + " Removed from Set List" }
          end
        end
    end

    def update
      @setlist = current_setlist
      @setlist_item = @setlist.setlist_items.find(params[:id])
      @setlist_item.update_attributes(params[:setlist_item])
      @setlist_items = @setlist.setlist_items

    respond_to do |format|
       format.html {  }
       format.json { head :ok }
     end


    end

    def destroy
      @setlist = current_setlist
      @setlist_item = SetlistItem.find(params[:id])
      @setlist_item.destroy
      @setlist_items = @setlist.setlist_items
      respond_to do |format|
          if @setlist.save
            format.html { redirect_to :back, notice: @setlist_item.song.song_title + " Removed from Set List" }
            #format.json { render json: @song, status: :created, location: @song }
          else
            format.html { render action: "new" }
            format.js { render json: @song.errors, status: :unprocessable_entity }
          end
        end
    end


    def update_song_order
        @setlist_item = SetlistItem.find(params[:setlist_item_id])
        @setlist_item.song_order_position = params[:song_order_position]
        @setlist_item.save!

        render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
      end

  
end
