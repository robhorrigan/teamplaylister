class SongsController < ApplicationController
  def index
  end

  def create

  end

  def show
    track_to_add = params[:q]
    @search_results = Song.search_spotify(track_to_add)
  end

  def update
  end

  def delete
  end
end
