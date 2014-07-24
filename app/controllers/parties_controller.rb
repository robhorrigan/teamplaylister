class PartiesController < ApplicationController
  def index
    @user_playlists = RestClient.get("https://api.spotify.com/v1/users/#{current_user.uid}/playlists", { "Authorization" => "Bearer #{current_user.token}"})
    @playlists = JSON.parse(@user_playlists)
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    uid = current_user.uid
    token = current_user.token
    spotify_data = Party.create_party(uid, params[:name], token)
    playlist_id = Party.get_playlist_id(spotify_data)
    tracks = "spotify:track:3P5LP0QEswwTGJSlESoeB5"
    if @party.save
      redirect_to party_path(@party)
    else
      render :new, flash[:notice] = "Sorry, there was an error. Penguins attacked your page!"
    end
  end

  def show
    uid = current_user.uid
    token = current_user.token
    
    Party.add_tracks(uid, party_id, token)
  end

  def update
  end

  def delete
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find(params[:code])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def party_params
    params.require(:party).permit(:name, :user_id)
  end
end
