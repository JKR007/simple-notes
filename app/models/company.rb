class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :name, presence: true
end
