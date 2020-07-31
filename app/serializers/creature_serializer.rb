class CreatureSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  belongs_to :adventure
  attributes :name,
             :descr,
             :category,
             :speed,
             :life,
             :constitution,
             :power,
             :wisdom,
             :strength,
             :size,
             :dexterity,
             :missile_skill,
             :armor_skill,
             :dodge_skill,
             :melee_skill,
             :parry_skill,
             :magical_defense,
             :personality,
             :outlook,
             :alliance,
             :tile_idx
end
