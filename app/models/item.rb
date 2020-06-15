class Item < ApplicationRecord
  belongs_to :thing
  belongs_to :room, optional: true
  belongs_to :actor, optional: true

  validate :has_room_or_actor


  def has_room_or_actor
    self.errors(:base, 'Must be in a room or on an actor') unless room_id || actor_id
  end
end
