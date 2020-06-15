class RegionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :descr, :width, :height
  has_many :rooms
end
