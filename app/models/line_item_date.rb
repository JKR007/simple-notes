class LineItemDate < ApplicationRecord
  belongs_to :note

  validates :date, presence: true, uniqueness: { scope: :note_id }
  scope :ordered, -> { order(date: :asc) }
end
