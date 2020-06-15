FactoryBot.define do
  factory :thing do
    adventure
    name { [Faker::Food.dish, Faker::Food.ingredient, Faker::Beer.name].sample }
  end
end
