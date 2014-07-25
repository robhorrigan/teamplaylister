class Song < ActiveRecord::Base
	belongs_to :party

  def self.search_spotify(track_song='*', track_artist='')
    gsub_track_song = track_song.gsub(' ','%20')
    gsub_track_artist = track_artist.gsub(' ','%20')

    songs_from_spotify = RestClient.get("https://api.spotify.com/v1/search?q=track:#{gsub_track_song}%20artist:#{gsub_track_artist}&limit=5&type=track")
    parsed_song = JSON.parse(songs_from_spotify)
  
    @songs_array = []
    
    parsed_song["tracks"]["items"].each do |song|
      song_hash = {}
        song_hash[:album_art] = song["album"]["images"][2]["url"]
        song_hash[:song_name] = song["name"]
        song_hash[:song_artist] = song["artists"][0]["name"] 
        song_hash[:song_album] = song["album"]["name"] 
        song_hash[:song_uri] = song['uri'] 
       @songs_array << song_hash
    end

    @songs_array
  end

end
