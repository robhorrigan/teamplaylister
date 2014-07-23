class PlaylistsController < ApplicationController
  def index
  end

  def create
  end

  def show
    @party = Party.new(:name => params["party_name"])
    @party.save
    @playlist = Playlist.new(:name => params["playlist_name"], :votes => params["vote_number"], :code => rand(36**5).to_s(36))
    @playlist.party = @party
    @playlist.save
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
