class Record < ApplicationRecord
  belongs_to :budget
  belongs_to :user
  has_one :category
  validates :date, :amounts, presence: true

end
