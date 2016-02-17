class TerrainSerializer < ActiveModel::Serializer
  attributes :id, :map_id, :tile_picture_id,
      :name,
      :description,
      :encounter_chance
end
