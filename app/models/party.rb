class Party < ActiveRecord::Base
  before_create :generate_code

  belongs_to :user

  def generate_code
    self.code = rand(36**5).to_s(36)
  end

  def self.create_party(uid, name, token)
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists", {name: "#{name}", public: false}.to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
  end

  def self.get_party_id(data_to_be_parsed)
    parsed_spotify_data = JSON.parse(data_to_be_parsed)
    parsed_spotify_data["id"]
  end

  def self.add_tracks(uid, party_id,token)
    encoded_url = URI.encode('uris=spotify:track:0mBkoM8r7KAQzZij5swTUL%2Cspotify:track:15uFqHGAOvaGCqikvgiW6w')
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists/#{party_id}/tracks", ["spotify:track:0mBkoM8r7KAQzZij5swTUL", "spotify:track:15uFqHGAOvaGCqikvgiW6w"].to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
    # request = Typhoeus::Request.new(
    #   "https://api.spotify.com/v1/users/#{uid}/playlists/#{playlist_id}/tracks?#{encoded_url}",
    #   {:method => :post,
    #   :headers => { "Content-Type" => "application/json", "Authorization" => "Bearer #{token}" }}
    # )
  end
end
