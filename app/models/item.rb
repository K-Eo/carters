class Item < ApplicationRecord
  has_many_attached :images

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true

  scope :with_preloaded_images, -> { preload(images_attachments: :blob) }
end
