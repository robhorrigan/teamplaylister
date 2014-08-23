Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_ID"], scope: 'playlist-modify-private playlist-modify-public streaming playlist-read-private user-read-private user-read-email'
end
