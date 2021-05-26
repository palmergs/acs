class RegionSerializer
  include JSONAPI::Serializer

  belongs_to :adventure
  attributes :name, :descr, :width, :height
  has_many :rooms
end
