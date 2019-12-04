class AssociationsValidator < ActiveModel::Validator
  def validate(student)
    if not student.room_id.nil? and not Room.exists?(student.room_id)
      student.errors[:room_id] << "must exist."
    end
  end
end

class Student < ApplicationRecord
  belongs_to :room, optional: true
  validates_with AssociationsValidator
  has_many :lectures, dependent: :destroy
  validates :student_number, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, allow_nil: true
  validates :student_number, :password, :student_name, :gender, :department, presence: true
  validates :gender, inclusion: {in: ['male', 'female']}
end
