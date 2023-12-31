class Note < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy
  has_many :line_items, through: :line_item_dates

  validates :title, presence: true

  scope :desc, -> { order(created_at: :desc)}

  # after_create_commit -> { broadcast_prepend_later_to "notes", partial: "notes/note", locals: { note: self }, target: "notes" }
  # # after_create_commit -> { broadcast_prepend_to "notes" } # this is shorthand of above - rails convention
  # after_update_commit -> { broadcast_replace_later_to "notes" }
  # after_destroy_commit -> { broadcast_remove_to "notes" }
  # all above three is can be written with single line of conde like below - rails syntactic sugar
  broadcasts_to ->(note) { [ note.company, "notes" ] }, inserts_by: :prepend

  def total_price
    line_items.sum(&:total_price)
  end
end
