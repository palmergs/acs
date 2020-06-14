class CreateCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :creatures do |t|
      t.string :type,             null: false, limit: 31, index: true
      t.integer :adventure_id,    null: false, index: true
      t.integer :tile_picture_id, null: false, index: true
      t.string :name,             null: false, limit: 63
      t.text :description,        null: false, default: ''
      t.integer :speed,           null: false, default: 6
      t.integer :life_force,      null: false, default: 10
      t.integer :constitution,    null: false, default: 10
      t.integer :power,           null: false, default: 10
      t.integer :wisdom,          null: false, default: 10
      t.integer :strength,        null: false, default: 10
      t.integer :size,            null: false, default: 10
      t.integer :dexterity,       null: false, default: 10
      t.integer :missile_skill,   null: false, default: 10
      t.integer :armor_skill,     null: false, default: 0
      t.integer :dodge_skill,     null: false, default: 25
      t.integer :melee_skill,     null: false, default: 25
      t.integer :parry_skill,     null: false, default: 25
      t.string :magical_defense,  null: false, limit: 15, default: Creature::MAGIC_NONE
      t.string :personality,      null: false, limit: 15, default: Creature::PERSONALITY_BRAVE
      t.string :outlook,          null: false, limit: 15, default: Creature::OUTLOOK_AGGRESSIVE
      t.string :alliance,         null: false, limit: 15, default: Creature::ALLIANCE_ENEMY

      t.timestamps
    end
  end
end
