class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :intro, :rating, :access
end
