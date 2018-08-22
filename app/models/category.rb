class Category < ApplicationRecord
  has_many :items

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  scope :newest, -> { order(created_at: :desc) }
end
