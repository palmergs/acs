module Concerns
  module HasDescription
    include ActiveSupport::Concern

    included do
      before_validation do
        self.description = '' unless self.description.present?
      end
    end

  end
end
