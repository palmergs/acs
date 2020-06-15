FactoryBot.define do
  factory :terrain_creature do
    terrain
    creature
    message { "A #{ self.creature.name } leaps out of the shadows!" }
  end
end
