class CreatePartySongs < ActiveRecord::Migration
  def change
    create_table :party_songs do |t|
    	t.belongs_to :song
      t.belongs_to :party

      t.timestamps
    end
  end
end
