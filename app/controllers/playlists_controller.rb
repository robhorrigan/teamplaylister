class PlaylistsController < ApplicationController
  def index
  end

  def create
  end

  def show
    @vote_number = params["vote_number"]
    @party_name = params["party_name"]
    render 'show'
  end

  def update
  end

  def delete
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_playlist
    @playlist = Playlist.find(params[:code])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def playlist_params
    params.require(:vote_number, :party_name)
  end
end
