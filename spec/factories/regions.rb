FactoryBot.define do
  factory :region do
    adventure
    name { "A neighborhood of #{ Faker::Nation.capital_city }" }
    width { 40 }
    height { 40 }
  end
end
