class PartiesController < ApplicationController
  before_action :set_party, only: [:show]

  def index
    # @user_playlists = RestClient.get("https://api.spotify.com/v1/users/#{current_user.uid}/playlists", { "Authorization" => "Bearer #{current_user.token}"})
    # @parties = JSON.parse(@user_playlists)
    @parties = current_user.parties
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    uid = current_user.uid
    token = current_user.token
    spotify_data = Party.create_party(uid, params[:party][:name], token)
    @party.spotify_playlist_id = Party.get_party_id(spotify_data)
    
    if @party.save
      redirect_to playlist_path(@party.code)
    else
      render :new, flash[:notice] = "Sorry, there was an error. Penguins attacked your page!"
    end
  end

  def show
    @songs = @party.songs
    @party = Party.find_by(:code => params["code"])
    track_song = params[:q1]
    track_artist = params[:q2]
    @search_results = Song.search_spotify(track_song, track_artist)
    binding.pry

    @track = params[:song_to_add] 
    if @track
      @song = Song.new
      @song.title = params["song_to_add"].split(" |; ")[0]
      @song.artist = params["song_to_add"].split(" |; ")[1]
      @song.spotify_uri = params["song_to_add"].split(" |; ")[2]

      track = @track
      @party
      spotify_playlist_id = @party.spotify_playlist_id
      user_id = @party.user 
      
      uid = user_id.uid
      token = user_id.token
      
      Party.add_tracks(uid, spotify_playlist_id, token, track)
    end
  end

  def update
  end

  def delete
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find_by(:code => params[:code])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_params
    params.require(:party).permit(:title, :user_id, :spotify_playlist_id)
  end
end
