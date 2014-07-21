class Song < ActiveRecord::Base
	belongs_to :playlist_songs
	has_many: :playlists through: :playlist_songs
end
