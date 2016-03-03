class Command::Rest < Command

  LIFE_FORCE_PER_REST = 1

  def perform
    if actor.wounded?
      actor.life_force += LIFE_FORCE_PER_REST
    end
  end
end
