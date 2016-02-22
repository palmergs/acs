class Actor < ApplicationRecord
  include Concerns::HasCreatureAttributes
  include Concerns::HasStrategy

  belongs_to :room
  belongs_to :creature

  has_many :items
end
