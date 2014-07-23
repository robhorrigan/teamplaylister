
class Playlist < ActiveRecord::Base
	belongs_to: :party
	belongs_to: :playlist, through: :parties

  RSpotify.authticate("a3d2521b73de4bcc87357ce82f8dbd0c", "2eaee1b3f89244c497a04b1c0d0491b3")

  def new_spotify_user
    spotify_user = RSpotify::User.new()

  def self.new_playlist(name)
    playlist = user.create_playlist!(name)
  end

  def self.new_tracks(tracks_array)
    playlist.add_tracks!(tracks)
  end

end
