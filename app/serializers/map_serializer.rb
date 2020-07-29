class MapSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :adventure
  attributes :name, :descr, :width, :height
  has_many :regions
end
