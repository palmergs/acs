class CreateTerrainCreatures < ActiveRecord::Migration[6.0]
  def change
    create_table :terrain_creatures do |t|
      t.belongs_to :terrain, null: false, foreign_key: true
      t.belongs_to :creature, null: false, foreign_key: true
      t.text :message, null: false, default: ''

      t.timestamps
    end

    add_index :terrain_creatures, [:terrain_id, :creature_id], unique: true, name: :idx_unique_terrain_creature
  end
end
