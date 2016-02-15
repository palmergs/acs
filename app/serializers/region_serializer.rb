class RegionSerializer < ActiveModel::Serializer
  attributes :id, :map_id, :name, :description, :width, :height, :x, :y
end
