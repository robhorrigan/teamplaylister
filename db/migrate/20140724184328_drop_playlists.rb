class DropPlaylists < ActiveRecord::Migration
  def change
  	drop_table :playlists
  end
end
