class Adventure < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  RATING_GENERAL = 'general'
  RATING_RESTRICTED = 'restricted'

  ACCESS_PRIVATE = 'private'
  ACCESS_PUBLIC = 'public'

  has_one :map, dependent: :destroy

  has_many :tile_pictures, dependent: :destroy

  before_validation do
    self.access = ACCESS_PRIVATE unless self.access.present?
    self.rating = RATING_GENERAL unless self.rating.present?
  end

  after_create do
    self.map = Map.create(adventure: self, name: 'World Map') unless self.map
  end

end
