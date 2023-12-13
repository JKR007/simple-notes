class Note < ApplicationRecord
  validates :title, presence: true

  scope :desc, -> { order(created_at: :desc)}
end
