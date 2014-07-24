class DropPartySongsTable < ActiveRecord::Migration
  def change
  	drop_table :party_songs
  end
end
