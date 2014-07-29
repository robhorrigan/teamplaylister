class Party < ActiveRecord::Base
  before_create :generate_code
  belongs_to :user
  has_many :songs

  def generate_code
    self.code = rand(36**4..36**5).to_s(36).upcase
  end

  def self.create_party(uid, name, token)
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists", {name: "#{name}", public: false}.to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
  end

  def self.get_party_id(data_to_be_parsed)
    parsed_spotify_data = JSON.parse(data_to_be_parsed)
    parsed_spotify_data["id"]
  end

  def self.add_tracks(uid, spotify_playlist_id, token, track)
    RestClient.post("https://api.spotify.com/v1/users/#{uid}/playlists/#{spotify_playlist_id}/tracks", ["#{track}"].to_json, {"Content-Type" => "application/json", "Authorization" => "Bearer #{token}"})
  end
end
