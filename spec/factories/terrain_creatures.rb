FactoryBot.define do
  factory :terrain_creature do
    terrain
    creature
    message { "A #{ creature.name } leaps out of the shadows!" }
  end
end
