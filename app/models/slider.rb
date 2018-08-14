class Slider < ApplicationRecord
  scope :actives, -> { where(active: true) }
end
