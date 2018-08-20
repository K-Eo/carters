class Slider < ApplicationRecord
  has_one_attached :image

  scope :actives, -> { where(active: true) }
  scope :order_by_active, -> { order(active: :desc) }
  scope :order_by_newest, -> { order(created_at: :desc) }
end
