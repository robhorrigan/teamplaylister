class Song < ActiveRecord::Base
	belongs_to :party

  def self.search_spotify(track_to_add)
    gsub_track_to_add = track_to_add.gsub(' ', '%20')
    songs_from_spotify = RestClient.get("https://api.spotify.com/v1/search?q=#{gsub_track_to_add}&limit=5&type=track")
    parsed_song = JSON.parse(songs_from_spotify)
  
    @songs_array = []
    
    parsed_song["tracks"]["items"].each do |song|
      song_hash = {}
        song_hash[:song_name] = song["name"]
        song_hash[:song_artist] = song["artists"][0]["name"] 
        song_hash[:song_album] = song["album"]["name"] 
        song_hash[:song_uri] = song['uri'] 
       @songs_array << song_hash
    end

    @songs_array
  end
end
