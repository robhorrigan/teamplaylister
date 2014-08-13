class PartiesController < ApplicationController
  before_action :set_party, only: [:show]

  def index
    @party = Party.new
    @parties = Party.where("user_id" => current_user)
  end

  def new
  end

  def create
    @party = Party.new(party_params)
    uid = current_user.uid
    name = params[:party][:name]
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
    if params["party_code"]
      @party = Party.find_by(:code => params["party_code"])
    else
      @party = Party.find_by(:code => params["code"])      
    end
    # @songs = @party.songs.order(votes: :desc)

    track_song = params[:q1]
    track_artist = params[:q2]
    if track_song || track_artist
      @search_results = Song.search_spotify(track_song, track_artist)
    end

    @track = params[:song_to_add] 
    if @track
      Song.persist_song(@track, @party)
      @songs = @party.songs
      RestClient.post("https://api.spotify.com/v1/users/#{@party.user.uid}/playlists/#{@party.spotify_playlist_id}/tracks", ["spotify:track:#{@track}"].to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{@party.user.token}"})
    end

#   eventual 'play method'
    # if params["party"] && params["party"]["user_id"] == "play_party"
    #   while @songs.size > 0 do
    #     RestClient.post("https://api.spotify.com/v1/users/#{@party.user.uid}/playlists/#{@party.spotify_playlist_id}/tracks", ["#{@songs.first}"].to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{@party.user.token}"})
    #     sleep(@songs.first.duration/1000 - 15)
    #     @songs.first.destroy
    #   end
    # end

    @phone_number = params[:phone_number]
    @message = "http://www.groovwith.me/#{@party.code}"
    if @phone_number 
      Party.message(@phone_number, @message)
    end
  end

  def join_party
    code = params[:code]
    if Party.find_by(:code => code)
      redirect_to playlist_path(code)
    else
      redirect_to root_path flash[:notice] = "Sorry, not a valid party code! Please try again."
    end
  end

  def update
  end

  def destroy
    @party = Party.find(params["id"])
    @party.destroy
    redirect_to parties_index_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find_by(:code => params[:code])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_params
    params.require(:party).permit(:party_code, :title, :name, :uid, :user_id, :spotify_playlist_id, :play_party)
  end
end
