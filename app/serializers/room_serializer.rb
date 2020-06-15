class RoomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :descr, :width, :height, :region_x, :region_y, :wall_tile_idx
end
