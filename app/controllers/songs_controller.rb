class SongsController < ApplicationController
  def index
  end

  def create  
  end

  def show
  end

  def update
   track = params{:song_to_add}
   Party.add_tracks(uid, party_id, token, track)
  end

  def delete
    # TODO: Party admin to delete tracks from Spotify using new remove API endpoint.
  end

  def up_vote
    @party = Party.find_by(:code => params[:code])
    @song = Song.find(params[:song_id])
    @song.votes += 1
    @song.save

    # TODO: This is where we will make AJAX upvote feature that notify user of successful vote and reorder queue. 
    # respond_to do |format|
    #   format.html { redirect_to @party, notice: 'Thanks for voting!' }
    #   format.js   {}
    # end
  end

  private 
  def songs_params
    params.require(:song).permit(:title, :artist, :album, :spotify_uri, :album_art, :duration_ms)
  end
end
  
