class CreateTerrains < ActiveRecord::Migration[6.0]
  def change
    create_table :terrains do |t|
      t.belongs_to :map, null: false, foreign_key: true
      t.string :name, null: false
      t.text :descr, null: false, default: ''
      t.boolean :block, null: false, default: false
      t.integer :encounter_chance, null: false, default: 0
      t.integer :tile_idx, null: false, default: 0

      t.timestamps
    end
  end
end
