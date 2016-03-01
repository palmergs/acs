module Concerns
  class HasLocation
    extend ActiveSupport::Concern

    included do

    end

    def location
      Location.new(self.x, self.y)
    end

    def location= loc
      self.x = loc.x
      self.y = loc.y
    end
  end
end
