class AssociationsValidator < ActiveModel::Validator
  def validate(student)
    if not student.room_id.nil? and not Room.exists?(student.room_id)
      student.errors[:room_id] << "must exist."
    end
    if not student.team_id.nil? and not Team.exists?(student.team_id)
      student.errors[:room_id] << "must exist."
    end
  end
end

class Student < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :team, optional: true
  validates_with AssociationsValidator
  has_many :lectures, dependent: :destroy
  validates :number, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, allow_nil: true
  validates :number, :password, :name, :gender, :team_id, presence: true
  validates :gender, inclusion: {in: ['male', 'female']}
end