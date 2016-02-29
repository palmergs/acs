class Strategy
  attr_accessor :actor

  def initialize actor
    @actor = actor
  end

  # @abstract
  def action
    raise NoMethodError.new("Please define #action for #{self.class.name}")
  end
end
