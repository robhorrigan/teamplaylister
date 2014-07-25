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
  end
end
