class RoomSerializer < ActiveModel::Serializer
  attributes :id, :region_id, :name, :description, :width, :height, :x, :y
end
