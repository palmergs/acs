class RoomSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :region
  attributes :name, :descr, :width, :height, :region_x, :region_y, :wall_tile_idx
end
