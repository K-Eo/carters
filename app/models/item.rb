class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  has_many_attached :images
end
