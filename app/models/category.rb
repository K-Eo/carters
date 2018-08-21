class Category < ApplicationRecord
  has_many :items

  validates :name, presence: true

  scope :newest, -> { order(created_at: :desc) }
end
