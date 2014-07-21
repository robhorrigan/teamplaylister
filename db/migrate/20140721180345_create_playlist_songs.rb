class CreatePlaylistSongs < ActiveRecord::Migration
  def change
    create_table :playlist_songs do |t|
      t.Song :belongs_to
      t.Playlist :belongs_to

      t.timestamps
    end
  end
end
