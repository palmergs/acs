class AddSpriteMapToAdventure < ActiveRecord::Migration[6.0]
  def change
    add_column :adventures, :sprite_map_id, :bigint, null: false, index: true
    add_index :sprite_maps, :path, unique: true
  end
end
