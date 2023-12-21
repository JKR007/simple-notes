class LineItemDate < ApplicationRecord
  belongs_to :note
  has_many :line_items, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :note_id }

  scope :ordered, -> { order(date: :asc) }

  broadcasts_to ->(line_item_date) { [line_item_date.note, "line_item_dates"] }, inserts_by: :prepend
end
