class SongsController < ApplicationController
  def index
  end

  def create
    track_to_add = params[:q]
    if track_to_add
      @search_results = Song.search_spotify(track_to_add)
    end  
  end

  def show

  end

  def update
  end

  def delete
  end
end
