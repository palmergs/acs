class Command
  attr_reader :actor, :item, :location

  def initialize actor, item = nil, x = nil, y = nil
    @actor = actor
    @item = item
    @location = Location.new(x, y)
  end

  # @abstract
  def perform
    raise NoMethodError.new("Please define #perform for #{self.class.name}")
  end
end
