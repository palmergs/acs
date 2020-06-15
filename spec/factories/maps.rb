FactoryBot.define do
  factory :map do
    adventure
    name { Faker::Nation.capital_city }
  end
end
