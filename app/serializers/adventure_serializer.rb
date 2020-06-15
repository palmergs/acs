# frozen_string_literal: true

class AdventureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug, :descr, :intro, :rating, :genre, :access, :created_at
end
