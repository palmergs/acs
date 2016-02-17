class Adventure < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  RATING_GENERAL = 'general'
  RATING_RESTRICTED = 'restricted'

  ACCESS_PRIVATE = 'private'
  ACCESS_PUBLIC = 'public'

  has_many :maps, dependent: :destroy

  has_many :tile_pictures, dependent: :destroy

  before_validation do
    self.access = ACCESS_PRIVATE unless self.access.present?
    self.rating = RATING_GENERAL unless self.rating.present?
  end

end
