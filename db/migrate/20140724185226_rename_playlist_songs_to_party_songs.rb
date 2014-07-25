class RenamePlaylistSongsToPartySongs < ActiveRecord::Migration
  def change
  	rename_table :playlist_songs, :party_songs
  end
end
