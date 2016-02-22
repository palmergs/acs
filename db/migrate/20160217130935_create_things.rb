class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.string :type,             null: false, limit: 31
      t.integer :adventure_id,    null: false, index: true
      t.integer :tile_picture_id, null: false, index: true

      t.string :name,             null: false, limit: 63
      t.text :description,        null: false, default: ''
      t.integer :weight,          null: false, default: 0
      t.integer :value,           null: false, default: 0
      t.boolean :disappear,       null: false, default: true
      t.integer :power,           null: false, default: 0
      t.integer :attack_adj,      null: false, default: 0
      t.integer :breakability,    null: false, default: 0
      t.boolean :magic,           null: false, default: false
      t.boolean :owner_only,      null: false, default: false
      t.integer :range,           null: false, default: 0
      t.text :pickup
      t.text :drop
      t.integer :max_carry,       null: false, default: 25000
      t.integer :max_stack,       null: false, default: 1
      t.boolean :buyable,         null: false, default: false


      t.string :activate_on,      null: false, default: Thing::ACTIVATE_NONE, limit: 31
      t.integer :power_cost,      null: false, default: 0
      t.string :spell_type
      t.string :activate_summary

      t.text :activate_message
      t.integer :acts_on_thing_id
      t.integer :acts_on_creature_id
      # t.integer :acts_on_sound_effect_id

      t.timestamps
    end
  end
end
