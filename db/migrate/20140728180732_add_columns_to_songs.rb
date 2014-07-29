class AddColumnsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :party_id, :string
  end
end
