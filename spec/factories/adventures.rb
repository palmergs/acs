FactoryBot.define do
  factory :adventure do
    sprite_map
    name { Faker::Book.title }
    descr { 'An adventure set in ...' }
    intro { 'Once upon a time...' }
    rating { Adventure::RATING.sample }
    access { Adventure::ACCESS.sample }
    genre { Adventure::GENRE.sample }
  end
end
