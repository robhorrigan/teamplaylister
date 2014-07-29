class AddMoreColumnsToSongsTable < ActiveRecord::Migration
  def change
    add_column :songs, :album_art, :string
    add_column :songs, :duration_ms, :string
  end
end
