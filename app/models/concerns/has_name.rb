module HasName
  extend ActiveSupport::Concern

  included do

    validates :name, presence: true

    scope :by_name, ->(q) {
      if q.present?
        where("#{ table_name }.name like ?", "%#{ q }%")
      end
    }
  end
end
