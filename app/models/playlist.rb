
class Playlist < ActiveRecord::Base
	belongs_to :party
	belongs_to :user

	attr_accessor :party, :name, :votes, :code
  # def self.uri_encode_parse(uid, playlist_name, token)

  def self.create_playlist(uid, playlist_name, token)
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists", {name: "#{playlist_name}", public: false}.to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
  end

  def self.get_playlist_id(data_to_be_parsed)
    parsed_spotify_data = JSON.parse(data_to_be_parsed)
    parsed_spotify_data["id"]
  end

  def self.add_tracks(uid, playlist_id,token)
    encoded_url = URI.encode('uris=spotify:track:0mBkoM8r7KAQzZij5swTUL%2Cspotify:track:15uFqHGAOvaGCqikvgiW6w')
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists/#{playlist_id}/tracks", ["spotify:track:0mBkoM8r7KAQzZij5swTUL", "spotify:track:15uFqHGAOvaGCqikvgiW6w"].to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
    # request = Typhoeus::Request.new(
    #   "https://api.spotify.com/v1/users/#{uid}/playlists/#{playlist_id}/tracks?#{encoded_url}",
    #   {:method => :post,
    #   :headers => { "Content-Type" => "application/json", "Authorization" => "Bearer #{token}" }}
    # )
  end

end
