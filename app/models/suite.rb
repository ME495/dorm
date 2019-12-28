class Suite < ApplicationRecord
  validates :name, :apartment, :unit, :floor, :number, :gender, :layout, presence: true
  validates :name, uniqueness: true
  validates :gender, inclusion: {in: ['male', 'female']}
  has_many :rooms, dependent: :nullify
end
