class RoomThing < ApplicationRecord
  belongs_to :room
  belongs_to :thing
end
