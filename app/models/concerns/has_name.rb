module HasName
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true

    scope :by_name, ->(q) {
      where("#{ table_name }.name like ?", "%#{ q }%") if q.present?
    }
  end
end
