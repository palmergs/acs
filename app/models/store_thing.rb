class StoreThing < ApplicationRecord
  belongs_to :store, class_name: 'Thing'
  belongs_to :thing
end
