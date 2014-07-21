class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.belongs_to :admin
      t.belongs_to :playlists

      t.timestamps
    end
  end
end
