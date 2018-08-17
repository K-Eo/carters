class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_many_attached :images

  scope :with_preloaded_images, -> { preload(images_attachments: :blob) }
end
