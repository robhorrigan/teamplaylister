class PlaylistsController < ApplicationController
  def index
    @user_playlists = RestClient.get("https://api.spotify.com/v1/users/#{@user.uid}/playlists", { "Authorization" => "Bearer #{@user.token}"})
    
  end

  def create
  end

  def show
    @party = Party.new(:name => params["party_name"], :user => current_user.name)
    @party.save
    @playlist = Playlist.new(:name => params["playlist_name"], :votes => params["vote_number"], :code => rand(36**5).to_s(36))
    @playlist.party = @party
    @playlist.save

    @user = User.find(session[:user_id])
    uid = @user.uid
    token = @user.token
    spotify_data = Playlist.create_playlist(uid, params["playlist_name"], token)
    playlist_id = Playlist.get_playlist_id(spotify_data)
    tracks = "spotify:track:3P5LP0QEswwTGJSlESoeB5"
    Playlist.add_tracks(uid, playlist_id, token)
    
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
