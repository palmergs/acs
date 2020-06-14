class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :thing_id,  null: false, index: true
      t.integer :room_id,   index: true
      t.integer :actor_id,  index: true
      t.integer :x,         null: false, index: true
      t.integer :y,         null: false, index: true
      t.integer :z,         null: false, index: true

      # items may invoke spells
      t.text :activate_message
      t.integer :acts_on_thing_id
      t.integer :acts_on_creature_id
      # t.integer :acts_on_sound_effect_id

      t.timestamps
    end
  end
end
