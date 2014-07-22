Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, '37b8b30fe6bb466cb2a0b5f9610ec6b8', 'ed0dfacba7444ba792450be9c24d0034', scope: 'playlist-modify-private playlist-modify-public streaming playlist-read-private user-read-private user-read-email'
end