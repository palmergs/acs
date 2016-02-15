class Adventure < ApplicationRecord

  RATING_GENERAL = 'general'
  RATING_RESTRICTED = 'restricted'

  ACCESS_PRIVATE = 'private'
  ACCESS_PUBLIC = 'public'

  before_validation do
    self.access = ACCESS_PRIVATE unless self.access.present?
    self.rating = RATING_GENERAL unless self.rating.present?
  end

end
