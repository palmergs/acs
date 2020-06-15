class CreateCreatures < ActiveRecord::Migration[6.0]
  def change
    create_table :creatures do |t|
      t.belongs_to :adventure, null: false, foreign_key: true
      t.string :name, null: false
      t.text :descr, null: false, default: 0
      t.string :category, null: false, default: Creature::NPC
      t.integer :speed, null: false, default: 6
      t.integer :life, null: false, default: 10
      t.integer :constitution, null: false, default: 10
      t.integer :power, null: false, default: 10
      t.integer :wisdom, null: false, default: 10
      t.integer :strength, null: false, default: 10
      t.integer :size, null: false, default: 10
      t.integer :dexterity, null: false, default: 10
      t.integer :missile_skill, null: false, default: 10
      t.integer :armor_skill, null: false, default: 0
      t.integer :dodge_skill, null: false, default: 25
      t.integer :melee_skill, null: false, default: 25
      t.integer :parry_skill, null: false, default: 25
      t.string :magical_defense, null: false, default: Creature::NO_MAGICAL_DEFENSE
      t.string :personality, null: false, default: Creature::BRAVE
      t.string :outlook, null: false, default: Creature::AGGRESSIVE
      t.string :alliance, null: false, default: Creature::ENEMY
      t.integer :tile_idx, null: false, default: 0

      t.timestamps
    end
  end
end
