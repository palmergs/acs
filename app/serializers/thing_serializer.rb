class ThingSerializer < ActiveModel::Serializer
  attributes :type,
      :id,
      :adventure_id,
      :tile_picture_id,
      :name,
      :description
end
