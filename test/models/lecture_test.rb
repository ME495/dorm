require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  def setup
    @room = Room.find_by_room_number('雁5-153-3')
    @student = Student.create(student_number: '2019E9876543210',
                              password: '123456',
                              student_name: '李四',
                              gender: 'male',
                              department: '计算机学院',
                              room_id: @room.id,
                              email: 'lisi@example.com')
  end

  test 'valid lecture' do
    lecture = Lecture.new(title: 'rails',
                          start_time: '2019-12-30 17:10:00',
                          end_time: '2019-12-30 18:10:00',
                          category: '计算机',
                          content: '介绍rails',
                          student_id: @student.id,
                          suite: '雁5-153')
    assert lecture.save
  end

  test 'should not save lecture when student is no exist' do
    lecture = Lecture.new(title: 'rails',
                          start_time: '2019-12-30 17:10:00',
                          end_time: '2019-12-30 18:10:00',
                          category: '计算机',
                          content: '介绍rails',
                          student_id: 11111,
                          suite: '雁5-153')
    assert_not lecture.save
  end

  test 'should not save lecture when suite does not match sutie of student' do
    lecture = Lecture.new(title: 'rails',
                          start_time: '2019-12-30 17:10:00',
                          end_time: '2019-12-30 18:10:00',
                          category: '计算机',
                          content: '介绍rails',
                          student_id: @student.id,
                          suite: '雁5-152')
    assert_not lecture.save
  end

  test 'should not save lecture without category' do
    lecture = Lecture.new(title: 'rails',
                          start_time: '2019-12-30 17:10:00',
                          end_time: '2019-12-30 18:10:00',
                          content: '介绍rails',
                          student_id: @student.id,
                          suite: '雁5-153')
    assert_not lecture.save
  end
end
