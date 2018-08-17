class Slider < ApplicationRecord
  has_one_attached :image

  scope :actives, -> { where(active: true) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }
end
