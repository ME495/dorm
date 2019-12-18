class SuiteValidator < ActiveModel::Validator
  def validate(lecture)
    if Student.exists?(lecture.student_id)
      student = Student.find(lecture.student_id)
      room = Room.find(student.room_id)
      if lecture.suite != room.suite
        lecture.errors[:suite] << 'must match suite of student'
      end
    end
  end
end

class Lecture < ApplicationRecord
  belongs_to :student 
  validates_with SuiteValidator
  validates :title, :start_time, :end_time, :category, :student_id, :suite, presence: true
end
