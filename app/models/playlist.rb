
class Playlist < ActiveRecord::Base
	belongs_to :party
	belongs_to :user

	attr_accessor :party, :name, :votes
	def initialize(party, name, votes)
		@code = rand(36**5).to_s(36)
	end

  # def self.uri_encode_parse(uid, playlist_name, token)

  def self.create_playlist(uid, playlist_name, token)
    # binding.pry
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists", {name: "#{playlist_name}", public: false}.to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
  end

  def self.get_playlist_id(data_to_be_parsed)
    parsed_spotify_data = JSON.parse(data_to_be_parsed)
    parsed_spotify_data["id"]
  end

  def self.add_tracks(uid, playlist_id,token)
    # binding.pry
    encoded_url = URI.encode('uris=spotify:track:0mBkoM8r7KAQzZij5swTUL%2Cspotify:track:15uFqHGAOvaGCqikvgiW6w')
    request = Typhoeus::Request.new(
      "https://api.spotify.com/v1/users/#{uid}/playlists/#{playlist_id}/tracks?#{encoded_url}",
      {:method => :post,
      :headers => { "Content-Type" => "application/json", "Authorization" => "Bearer #{token}" }}
    )
  end

end