class Location

  NORTH = :north
  SOUTH = :south
  EAST = :east
  WEST = :west

  attr_reader :x, :y

  def initialize x, y
    @x = x.present? ? x.to_i : nil
    @y = y.present? ? y.to_i : nil
  end

  def exists?
    x && y
  end

  def adjacent? location
    return false unless exists? && location.exists?

    diffx = Math.abs(x - location.x)
    diffy = Math.abs(y - location.y)
    (diffx == 0 && diffy == 1) || (diffy == 0 && diffx == 1)
  end

  def direction_to location
    return nil unless exists? && location.exists?
    return nil if self == location

    diffx = x - location.x
    diffy = y - location.y
    if Math.abs(diffx) >= Math.abs(diffy)
      diffx > 0 ? WEST : EAST
    else
      diffy > 0 ? NORTH : SOUTH
    end
  end

  def ==(o)
    o.respond_to?(:x) && o.respond_to?(:y) && o.x == x && o.y == y
  end
  alias_method :eql?, :==

  def hash
    [x, y].hash
  end

end
