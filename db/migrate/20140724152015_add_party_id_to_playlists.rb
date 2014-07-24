class AddPartyIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :party_id, :int
  end
end
