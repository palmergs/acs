class MapSerializer
  include JSONAPI::Serializer

  belongs_to :adventure
  attributes :name, :descr, :width, :height
  has_many :regions
end
