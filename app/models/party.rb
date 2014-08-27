class Party < ActiveRecord::Base
  validates :name, :presence => true
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

  def self.message(phone_number, message)
    phone_numbers = []
    phone_numbers << phone_number
    phone_numbers.each do |number|
      account_sid = ENV["TWILLIO_SID"]
      auth_token = ENV["TWILLIO_AUTH_TOKEN"]
      client = Twilio::REST::Client.new account_sid, auth_token    

      from = ENV["TWILIO_NUMBER"]

      client.account.messages.create(
       :from => from,
       :to => number,
       :body => message
     )
    end
  end
end
