require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  test 'valid student' do
    room = Room.find_by_room_number('雁5-153-3')
    student = Student.new(student_number: '2019E9876543210',
                          password: '123456',
                          student_name: '李四',
                          gender: 'male',
                          department: '计算机学院',
                          room_id: room.id,
                          email: 'lisi@example.com')
    assert student.save
  end

  test 'should save student without room id' do
    student = Student.new(student_number: '2019E9876543210',
                          password: '123456',
                          student_name: '李四',
                          gender: 'male',
                          department: '计算机学院',
                          email: 'lisi@example.com')
    assert student.save
  end

  test 'should not save student when its student number is exist' do
    room = Room.find_by_room_number('雁5-153-3')
    student1 = Student.new(student_number: '2019E9876543210',
                           password: '123456',
                           student_name: '李四',
                           gender: 'male',
                           department: '计算机学院',
                           room_id: room.id,
                           email: 'lisi@example.com')
    student1.save
    student2 = Student.new(student_number: '2019E9876543210',
                           password: '123456',
                           student_name: '李四',
                           gender: 'male',
                           department: '计算机学院',
                           room_id: room.id,
                           email: 'lisi@example.com')
    assert_not student2.save
  end

  test 'should not save student when its room is not exits' do
    room = Room.find_by_room_number('雁5-153-3')
    student = Student.create(student_number: '2019E9876543210',
                             password: '123456',
                             student_name: '李四',
                             gender: 'male',
                             department: '计算机学院',
                             room_id: room.id,
                             email: 'lisi@example.com')
    student.room_id = 11111
    assert_not student.save
  end

  test 'should not save student when its email is not null and invalid' do
    room = Room.find_by_room_number('雁5-153-3')
    student = Student.create(student_number: '2019E9876543210',
                             password: '123456',
                             student_name: '李四',
                             gender: 'male',
                             department: '计算机学院',
                             room_id: room.id,
                             email: 'lisi@example.com')
    student.email = 'asdfsadf'
    assert_not student.save
    student.email = nil
    assert student.save
  end

  test 'should not save student without student name' do
    room = Room.find_by_room_number('雁5-153-3')
    student = Student.new(student_number: '2019E9876543210',
                          password: '123456',
                          gender: 'male',
                          department: '计算机学院',
                          room_id: room.id,
                          email: 'lisi@example.com')
    assert_not student.save
  end

  test 'should not save student when gender is not in {"male", "female"}' do
    room = Room.find_by_room_number('雁5-153-3')
    student = Student.new(student_number: '2019E9876543210',
                          password: '123456',
                          student_name: '李四',
                          gender: 'man',
                          department: '计算机学院',
                          room_id: room.id,
                          email: 'lisi@example.com')
    assert_not student.save
  end

  test 'should destory lecture when destory student' do
    room = Room.find_by_room_number('雁5-153-3')
    student = Student.create(student_number: '2019E9876543210',
                             password: '123456',
                             student_name: '李四',
                             gender: 'male',
                             department: '计算机学院',
                             room_id: room.id,
                             email: 'lisi@example.com')
    student.lectures.create(title: 'rails',
                            start_time: '2019-12-30 17:10:00',
                            end_time: '2019-12-30 18:10:00',
                            category: '计算机',
                            content: '介绍rails',
                            suite: '雁5-153')
    assert_not_nil Lecture.find_by_student_id(student.id)
    student.destroy
    assert_nil Lecture.find_by_student_id(student.id)
  end
end
