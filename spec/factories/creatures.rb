FactoryBot.define do
  factory :creature do
    adventure
    name { Faker::Name.name }
  end
end
