class AddAttributesToParties < ActiveRecord::Migration
  def change
  	add_column :parties, :name, :string
  	add_column :parties, :code, :string
  	rename_column :parties, :playlists_id, :playlist_id
  end
end