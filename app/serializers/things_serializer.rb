class ThingSerializer < ActiveModel::Serializer
  attributes :id, :adventure_id,
      :name,
      :description
end
