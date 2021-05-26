class RoomSerializer
  include JSONAPI::Serializer

  set_key_transform :dash
  belongs_to :region
  attributes :name, :descr, :width, :height, :region_x, :region_y, :wall_tile_idx
end
