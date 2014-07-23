class PlaylistsController < ApplicationController
  def index
  end

  def create
  end

  def show
    @party = Party.new(params["party_name"])
    @playlist = Playlist.new(@party, params["playlist_name"], params["vote_number"])
    binding.pry
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
    params.require(:vote_number, :party_name, :playlist_name)
  end
end
