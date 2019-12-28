require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  def setup
    @student = Student.find(1)
    @suite = @student.room.suite
  end

  test 'valid lecture' do

    lecture = @student.lectures.create(title: 'rails',
                                       start_time: '2019-12-30 17:10:00',
                                       end_time: '2019-12-30 18:10:00',
                                       category: '计算机',
                                       content: '介绍rails',
                                       suite: @suite.name)
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
    lecture = @student.lectures.create(title: 'rails',
                                       start_time: '2019-12-30 17:10:00',
                                       end_time: '2019-12-30 18:10:00',
                                       category: '计算机',
                                       content: '介绍rails',
                                       suite: '雁5-152')
    assert_not lecture.save
  end

  test 'should not save lecture without category' do
    lecture = @student.lectures.create(title: 'rails',
                                       start_time: '2019-12-30 17:10:00',
                                       end_time: '2019-12-30 18:10:00',
                                       content: '介绍rails',
                                       suite: @suite.name)
    assert_not lecture.save
  end
end
