class MapSerializer < ActiveModel::Serializer
  attributes :id, :adventure_id, :name, :description, :width, :height
end
