class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|
      t.belongs_to :adventure, null: false, foreign_key: true
      t.string :name, null: false
      t.text :descr, null: false, default: ''

      # Determines if a thing can be weilded (WEAPON), worn (ARMOR), or
      # simply carried (TREASURE).
      t.string :category, null: false, default: Thing::TREASURE

      # Weight: let's call it an ounce 16 == 1lb, 35 ~= 1kg
      t.integer :weight, null: false, default: 1
      
      # Need a configuration in the adventure to determine the base value
      t.integer :value, null: false, default: 0

      # If false, this thing will never be dropped by a defeated enemy
      t.boolean :droppable, null: false, default: true

      # Changes the amount of damage done by an attack or spell
      t.integer :power, null: false, default: 0

      # Changes the chance to hit
      t.integer :attack, null: false, default: 0

      # Percentage chance it will break and be destroyed if used
      t.integer :breakability, null: false, default: 0

      # If true, this thing is magic and damage opponents that are resistent
      # to non-magical effects
      t.boolean :magic, null: false, default: false

      # If non-0 this weapon or item can be used at range
      t.integer :range, null: false, default: 0

      # How many may be carried?
      t.integer :max_carry, null: false, default: 25_000

      # How many will be stacked as a single tile image
      t.integer :max_stack, null: false, default: 1

      # Can this thing be bought in a store?
      t.boolean :buyable, null: false, default: false

      # Which tile is used to display this item
      t.integer :tile_idx, null: false, default: 0

      t.timestamps
    end
  end
end
