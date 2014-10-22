FactoryGirl.define do
  factory :party do |f|
    f.name { Faker::Lorem.word }
    f.code { Faker::Lorem.characters(5) }
    f.user_id { Faker::Lorem.characters(10) }
    f.spotify_playlist_id { Faker::Lorem.characters(22) }
  end

  trait :party_name do
    Faker::Lorem.word
  end

  trait :code do
    Faker::Lorem.characters(5)
  end

  trait :user_id do
    Faker::Lorem.characters(10)
  end

  trait :spotify_playlist_id do
    Faker::Lorem.characters(22)
  end
end
