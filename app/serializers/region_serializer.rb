class RegionSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :adventure
  attributes :name, :descr, :width, :height
  has_many :rooms
end
