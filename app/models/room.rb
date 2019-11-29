class AmountValidator < ActiveModel::Validator
  def validate(room)
    if room.amount > room.capacity
      room.errors[:amount] << 'cannot be greater than capacity.'
    end
  end
end

class Room < ApplicationRecord
  has_many :students
  validates :room_number, :apartment, :unit, :capacity, :floor, :suite, presence: true
  validates :unit, :capacity, :amount, :floor, numericality: {only_integer: true}
  validates :capacity, :amount, numericality: {greater_than_or_equal_to: 0}
  validates :room_number, uniqueness: true
  validates_with AmountValidator
  validates :gender, inclusion: {in: ['male', 'female']}
end

