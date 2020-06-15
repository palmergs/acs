module HasDescription
  extend ActiveSupport::Concern

  included do
    before_validation do
      self.description = '' unless description.present?
    end
  end
end
