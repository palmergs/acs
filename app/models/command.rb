class Command
  attr_reader :actor, :item, :x, :y

  def initialize actor, item = nil, x = nil, y = nil
    @actor = actor
    @item = item
    @x = x
    @y = y
  end
end
