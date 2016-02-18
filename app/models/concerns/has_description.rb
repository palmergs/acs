module Concerns
  module HasDescription
    extend ActiveSupport::Concern

    included do
      before_validation do
        self.description = '' unless self.description.present?
      end
    end

  end
end
