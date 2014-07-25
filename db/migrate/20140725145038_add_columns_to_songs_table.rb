class AddColumnsToSongsTable < ActiveRecord::Migration
  def change
  	  	rename_column :songs, :genre, :album
  	  	rename_column :songs, :name, :title
  	  	add_column :songs, :spotify_uri, :string
  end
end
