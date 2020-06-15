class Actor < ApplicationRecord
  belongs_to :room
  belongs_to :creature
end
