class Command::DropItem < Command
  def perform
    return false unless item
    return false if item.thing.owner_only
    return false unless item.actor == actor
    return false unless location.adjacent?(actor.location)

    if item.thing.disappear?
      item.destroy
    else
      item.actor = nil
      item.room = actor.room
      item.location = location
      item.save
    end
  end
end
