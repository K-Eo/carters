class Slider < ApplicationRecord
  scope :actives, -> { where(active: true) }
  has_one_attached :image
end
