class Command::WieldItem > Command
  def perform
    return false unless item
    return false unless item.actor == actor
    if item.is_a?(Weapon)
      actor.ready_weapon = item
    elsif item.is_a?(Armor)
      actor.ready_armor = item
    else
      false
    end
  end
end
