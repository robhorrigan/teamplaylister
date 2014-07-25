class ChangePartySpotifyAttributes < ActiveRecord::Migration
  def change
  	rename_column :parties, :playlist_id, :spotify_playlist_id
  	change_column :parties, :spotify_playlist_id, :string
  end
end
