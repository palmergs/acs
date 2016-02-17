class TilePictureSerializer < ActiveModel::Serializer
  attributes :id,
      :name,
      :description, 
      :path,
      :category,
      :setting
end
