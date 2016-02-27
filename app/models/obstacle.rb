class Obstacle < Thing

  def can_activate_on
    [ ACTIVATE_BUMP ]
  end

end
