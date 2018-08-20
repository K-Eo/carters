class Slider < ApplicationRecord
  has_one_attached :image

  scope :actives, -> { where(active: true) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }
  scope :order_by_active, -> { order(active: :desc) }
  scope :order_by_newest, -> { order(created_at: :desc) }
end
