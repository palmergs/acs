FactoryBot.define do
  factory :adventure do
    name { Faker::Book.title }
    descr { 'An adventure set in ...' }
    intro { 'Once upon a time...' }
    rating { Adventure::RATING.sample }
    access { Adventure::ACCESS.sample }
    genre { Adventure::GENRE.sample }
  end
end
