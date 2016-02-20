class Spell < ApplicationRecord
  include Concerns::HasName
  include Concerns::HasDescription

  belongs_to :adventure
end
