class Item < ApplicationRecord
  include PgSearch
  belongs_to :category
  has_many_attached :images

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true

  scope :with_preloaded_images, -> { preload(images_attachments: :blob) }
  pg_search_scope :search, against: [:title],
                           using: { tsearch: { prefix: true, dictionary: "spanish" } },
                           ignoring: :accents

  class << self
    def with_filter(sort)
      if sort.present? && Item.column_names.include?(sort)
        order(sort)
      else
        order(created_at: :desc)
      end
    end
  end
end
