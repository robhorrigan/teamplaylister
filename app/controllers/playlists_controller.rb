class PlaylistsController < ApplicationController
  def index
    @user_playlists = RestClient.get('https://api.spotify.com/v1/users/1249884999/playlists', { "Authorization" => "Bearer BQDRVCoxVkx_q9sUa-P7paM76PQvfAZnVbABHkxlAYgRJ4TxrleO5QESpvY1C8iL8CCkVsYP2xaec8QldxLNHRZ8xY0l7V4g9bdtPkR8SawBErvqRbjdMB4xg_0Qh_t8P6DXkJlb8O7O-DQe-pbQ_tqz6pcoHGc1pONyjA0jFukTxf6TMxyvY6uQdliND2ftj7zGO6_cDon3BGtV"})
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
