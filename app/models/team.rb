class Team < ApplicationRecord
  validates :name, :department, presence: true
  validates :name, uniqueness: true
  has_many :students, dependent: :nullify
  has_many :rooms, dependent: :nullify
end
