class Item < ApplicationRecord
  include PgSearch
  belongs_to :category
  has_one_attached :cover

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0 }

  validates :discount, presence: true,
                       numericality: { only_integer: true, greater_than: 0, less_than: 100 },
                       if: :with_discount?

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

  def total
    return price unless with_discount
    price - (discount * price / 100)
  end

  def with_discount?
    with_discount
  end
end
