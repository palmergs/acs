class Item < ApplicationRecord
  belongs_to :thing
  belongs_to :room, optional: true
  belongs_to :actor, optional: true

  validate :room_or_actor?

  def room_or_actor?
    errors.add(:base, 'Must be in a room or on an actor') unless room_id || actor_id
    errors.add(:base, 'Can not be both in a room and on an actor') if room_id && actor_id
  end
end
