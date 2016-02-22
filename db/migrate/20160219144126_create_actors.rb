class CreateActors < ActiveRecord::Migration[5.0]
  def change
    create_table :actor do |t|
      t.integer :room_id,       null: false, index: true
      t.integer :creature_id,   null: false, index: true
      t.integer :x,             null: false, index: true
      t.integer :y,             null: false, index: true

      t.integer :speed,         null: false, default: 0
      t.integer :life_force,    null: false, default: 0
      t.integer :life_force_temp, null: false, default: 0
      t.integer :constitution,  null: false, default: 0
      t.integer :power,         null: false, default: 0
      t.integer :power_temp,    null: false, default: 0
      t.integer :wisdom,        null: false, default: 0
      t.integer :strength,      null: false, default: 0
      t.integer :encumbrance,   null: false, default: 0
      t.integer :size,          null: false, default: 0
      t.integer :dexterity,     null: false, default: 0
      t.integer :missile_skill, null: false, default: 0
      t.integer :armor_skill,   null: false, default: 0
      t.integer :dodge_skill,   null: false, default: 0
      t.integer :melee_skill,   null: false, default: 0
      t.string :magical_defense, null: false, default: Actor::MAGIC_NONE, limit: 15
      t.string :personality,    null: false, default: Actor::PERSONALITY_BRAVE, limit: 15
      t.string :outlook,        null: false, default: Actor::OUTLOOK_AGGRESSIVE, limit: 15
      t.string :alliance,       null: false, default: Actor::ALLIANCE_ENEMY, limit: 15

      t.timestamps
    end
  end
end
