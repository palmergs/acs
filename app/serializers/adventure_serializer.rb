# frozen_string_literal: true

class AdventureSerializer
  include JSONAPI::Serializer

  attributes :name, :slug, :descr, :intro, :rating, :genre, :access, :created_at
end
