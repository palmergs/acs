class CreatureThing < ApplicationRecord
  belongs_to :creature
  belongs_to :thing
end
