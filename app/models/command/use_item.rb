class Command::UseItem < Command
  def perform
    return false unless item
    return false unless item.thing.activate_on == Thing::ACTIVATE_USE

    if actor.power > item.thing.power_cost
      actor.power -= item.thing.power_cost
      # TODO: activate power
    else
      false
    end
  end
end
