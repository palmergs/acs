# frozen_string_literal: true

module HasSlug
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :slug, presence: true, uniqueness: true

    before_validation on: :create do
      self.slug = slugify(name)
    end

    scope :by_slug, ->(slug) {
      where(slug: slug) if slug
    }

    def slugify str
      return nil unless str

      tmp = str.to_s.strip.gsub(/[\s_-]+/, '-').downcase
      tmp += "-#{ Time.now.strftime('%y%m%d%H%M') }#{ rand(1000) }"
      tmp
    end
  end
end
