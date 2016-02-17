class CreateTerrains < ActiveRecord::Migration[5.0]
  def change
    create_table :terrains do |t|
      t.integer :map_id,            null: false, index: true
      t.string :name,               null: false, limit: 63
      t.text :description,          null: false, default: ''
      t.integer :tile_picture_id,   null: false
      t.integer :encounter_chance,  null: false, default: 0

      t.timestamps
    end
  end
end
