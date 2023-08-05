class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :budgets, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :meetings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
