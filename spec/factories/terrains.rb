FactoryBot.define do
  factory :terrain do
    map
    name { [Faker::Space.planet, Faker::Space.moon, Faker::Space.meteorite].sample }
  end
end
