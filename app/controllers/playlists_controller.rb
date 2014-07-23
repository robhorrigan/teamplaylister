class PlaylistsController < ApplicationController
  def index
    user_playlists = RestClient.get('https://api.spotify.com/v1/users/1249884999/playlists', { "Authorization" => "Bearer BQDRVCoxVkx_q9sUa-P7paM76PQvfAZnVbABHkxlAYgRJ4TxrleO5QESpvY1C8iL8CCkVsYP2xaec8QldxLNHRZ8xY0l7V4g9bdtPkR8SawBErvqRbjdMB4xg_0Qh_t8P6DXkJlb8O7O-DQe-pbQ_tqz6pcoHGc1pONyjA0jFukTxf6TMxyvY6uQdliND2ftj7zGO6_cDon3BGtV"})
    @my_list = JSON.parse(user_playlists)
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
