class Adventure < ApplicationRecord
  include Concerns::HasName

  RATING_GENERAL = 'general'
  RATING_RESTRICTED = 'restricted'

  ACCESS_PRIVATE = 'private'
  ACCESS_PUBLIC = 'public'

  has_many :maps, dependent: :destroy

  has_many :tile_pictures, dependent: :destroy

  before_validation do
    self.description = '' unless self.description.present?
    self.access = ACCESS_PRIVATE unless self.access.present?
    self.rating = RATING_GENERAL unless self.rating.present?
  end

end
