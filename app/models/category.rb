class Category < ApplicationRecord
  validates :name, presence: true

  scope :newest, -> { order(created_at: :desc) }
end
