class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :uid
      t.string      :name
      t.text        :token
      t.text        :refresh_token
      t.text        :image
      t.timestamps
    end
  end
end
