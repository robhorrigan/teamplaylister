FactoryGirl.define do
  factory :song do |f|
    f.name { Faker::Lorem.word }
    f.code { Faker::Lorem.characters(5) }
    f.user_id { Faker::Lorem.characters(10) }
    f.spotify_playlist_id { Faker::Lorem.characters(22) }
  end
