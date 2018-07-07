FactoryBot.define do
  factory :terrain_creature do
    terrain
    creature
    message { "A #{ creature.name } emerges from the #{ terrain.name }." }
  end

end
