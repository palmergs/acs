class MapSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :descr, :width, :height
end
