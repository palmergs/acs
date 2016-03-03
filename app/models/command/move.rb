class Command::Move < Command

  def perform
    return Command::Wait.new(actor, item, location).perform if actor.location == location

    next_location = actor.location.step_towards(location)

    opponent = actor.room.actor_at(next_location)
    if opponent.present?
      melee_attack(opponent, next_location)
    else
      items = actor.room.items_at(next_location)
      if items.present?
        top_item = items.first
        case top_item.thing
        when Obstacle
          bump_stack(items, next_location)
        when Space
          enter_stack(items, next_location)
        when Store
          enter_store(items, next_location)
        when Portal
          enter_portal(items, next_location)
        else
          pickup_stack(items, next_location)
        end
      else
        actor.location = next_location
      end
    end
  end

  def melee_attack defender, next_location
    if actor.readied_weapon
      # TODO: attack with weapon
    else
      # TODO: attack unarmed
    end
  end

  def bump_stack items, next_location

  end

  def enter_stack items, next_location

  end

  def enter_store items, next_location

  end

  def enter_portal items, next_location

  end

  def pickup_stack items, next_location
    items.each do |item|
      thing = item.thing
      unless thing.owner_only?

      end
    end
  end
end
