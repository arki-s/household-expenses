class Record < ApplicationRecord
  belongs_to :budget
  belongs_to :user
  belongs_to :category
  validates :date, :amounts, presence: true
  validates :category_id, presence: true
end
