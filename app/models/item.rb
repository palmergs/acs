class Item < ApplicationRecord
  include Concerns::HasEffect
  
  belongs_to :thing

  # An item can be in a room; or carried by an actor
  belongs_to :room, optional: true
  belongs_to :actor, optional: true

  validate :carried_or_in_room

  def carried_or_in_room
    unless room || actor
      self.errors(:base, "An item must be carried or in a room")
    end
  end
end
