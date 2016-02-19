class CreateTerrainCreatures < ActiveRecord::Migration[5.0]
  def change
    create_table :terrain_creatures do |t|
      t.integer :terrain_id,    null: false, index: true
      t.integer :creature_id,   null: false, index: true
      t.text :message,          null: false, default: ''

      t.timestamps
    end
  end
end
