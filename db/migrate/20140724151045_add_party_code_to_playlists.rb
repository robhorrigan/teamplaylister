class AddPartyCodeToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :party_code, :string
  end
end
