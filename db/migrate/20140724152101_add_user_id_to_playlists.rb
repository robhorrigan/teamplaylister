class AddUserIdToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :user_id, :int
  end
end
