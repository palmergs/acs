FactoryGirl.define do
  factory :creature do
    type "Creature"
    adventure
    tile_picture
    sequence(:name) {|n| "Creature ##{ n }" }
    description "A slithering, creeping, slimy, friendly elf..."
    speed 6
    life_force 10
    constitution 10
    power 10
    wisdom 10
    strength 10
    size 10
    dexterity 10
    missile_skill 10
    armor_skill 0
    dodge_skill 25
    melee_skill 25
    parry_skill 25
    magical_defense "none"
    personality "fighter"
    outlook "aggressive"
    alliance "enemy"
  end

end
