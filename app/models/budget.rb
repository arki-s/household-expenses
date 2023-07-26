class Budget < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy
  validates :name, :amounts, presence: true
  validates :start_time, :end_time, presence: true
end
