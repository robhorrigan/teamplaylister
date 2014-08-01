class AddVoteColumnToSongsTable < ActiveRecord::Migration
  def change
  	 add_column :songs, :votes, :int, default: 0

  end
end
