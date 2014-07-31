class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :party_code
      t.string :ip
    end
  end
end
