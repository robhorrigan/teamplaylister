class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.Admin :belongs_to
      t.Playlist :belongs_to

      t.timestamps
    end
  end
end
