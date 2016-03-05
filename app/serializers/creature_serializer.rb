class CreatureSerializer < ActiveModel::Serializer
  attributes :id, :adventure_id,
      :name,
      :description
end
