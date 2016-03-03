class Command::Fire < Command

  def perform
    return false unless actor.readied_weapon

    weapon = actor.readied_weapon
    return false unless weapon.range > 0
    return false if actor.location.distance_to(location) > weapon.range

    # TODO: handle attack
  end
end
