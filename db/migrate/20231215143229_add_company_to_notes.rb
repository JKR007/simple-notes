class AddCompanyToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :company, null: false, foreign_key: true
  end
end
