class PictureSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, 
      :description, 
      :path, 
      :category, 
      :created_at
end
