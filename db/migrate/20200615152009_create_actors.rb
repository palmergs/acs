class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :category, null: false, default: Creature::NPC
      t.belongs_to :room, null: false, foreign_key: true
      t.belongs_to :creature, null: false, foreign_key: true
      t.integer :x, null: false, default: 0
      t.integer :y, null: false, default: 0
      t.integer :speed, null: false, default: 6
      t.integer :life, null: false, default: 10
      t.integer :life_temp, null: false, default: 0
      t.integer :power, null: false, default: 10
      t.integer :power_temp, null: false, default: 0
      t.integer :constitution, null: false, default: 10
      t.integer :wisdom, null: false, default: 10
      t.integer :strength, null: false, default: 10
      t.integer :size, null: false, default: 10
      t.integer :dexterity, null: false, default: 10
      t.integer :encumbrance, null: false, default: 0
      t.integer :missile_skill, null: false, default: 10
      t.integer :armor_skill, null: false, default: 0
      t.integer :dodge_skill, null: false, default: 25
      t.integer :melee_skill, null: false, default: 25
      t.integer :parry_skill, null: false, default: 25
      t.string :magical_defense, null: false, default: Creature::NO_MAGICAL_DEFENSE
      t.string :personality, null: false, default: Creature::BRAVE
      t.string :outlook, null: false, default: Creature::AGGRESSIVE
      t.string :alliance, null: false, default: Creature::ENEMY

      t.timestamps
    end
  end
end
