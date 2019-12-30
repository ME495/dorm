class AmountValidator < ActiveModel::Validator
  def validate(room)
    if not room.amount.nil? and not room.capacity.nil? and room.amount > room.capacity
      room.errors[:amount] << 'cannot be greater than capacity.'
    end
  end
end

class Room < ApplicationRecord
  has_many :students, dependent: :nullify
  belongs_to :team, optional: true
  belongs_to :suite, optional: true
  validates :name, :number, :suite_id, :capacity, :amount, :gender, presence: true
  validates :gender, inclusion: {in: ['male', 'female']}
  validates :capacity, :amount, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :name, uniqueness: true
  validates_with AmountValidator
end
