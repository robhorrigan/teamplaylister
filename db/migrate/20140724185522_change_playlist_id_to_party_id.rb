class ChangePlaylistIdToPartyId < ActiveRecord::Migration
  def change
  	rename_column :party_songs, :playlist_id, :party_id
  end
end
