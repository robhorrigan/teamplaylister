FactoryGirl.define do
  factory :party do |f|
    f.name { Faker::Lorem.word(10) }
    f.name { Faker::Name.name }
    f.token { Faker::Lorem.characters(220) }
    f.refresh_token { Faker::Lorem.characters(131) } 
  end

  trait :name do
    Faker::Lorem.characters(10)
  end
  trait :name do
    Faker::Name.name
  end
  trait :token do
    Faker::Lorem.characters(220)
  end
  trait :refresh_token do
    Faker::Lorem.characters(131)
  end
end
