require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @room = Room.find(1)
    @team = @room.team
  end

  test 'valid student' do
    student = @room.students.create(number: '2019E9876543213',
                                    password: '123456',
                                    name: '王五',
                                    gender: 'male',
                                    team_id: @team.id,
                                    email: 'lisi@example.com')
    assert student.save
  end

  test 'should not save student when its student number is exist' do
    student = @room.students.create(number: '2019E9876543210',
                                    password: '123456',
                                    name: '王五',
                                    gender: 'male',
                                    team_id: @team.id,
                                    email: 'lisi@example.com')
    assert_not student.save
  end

  test 'should not save student when its email is not null and invalid' do
    student = @room.students.create(number: '2019E9876543213',
                                    password: '123456',
                                    name: '王五',
                                    gender: 'male',
                                    team_id: @team.id,
                                    email: 'lisi@example.com')
    student.email = 'asdfsadf'
    assert_not student.save
    student.email = nil
    assert student.save
  end

  test 'should not save student without student name' do
    student = @room.students.create(number: '2019E9876543213',
                                    password: '123456',
                                    gender: 'male',
                                    team_id: @team.id,
                                    email: 'lisi@example.com')
    assert_not student.save
  end

  test 'should not save student when gender is not in {"male", "female"}' do
    student = @room.students.create(number: '2019E9876543213',
                                    password: '123456',
                                    name: '王五',
                                    gender: 'man',
                                    team_id: @team.id,
                                    email: 'lisi@example.com')
    assert_not student.save
  end

  test 'should destory lecture when destory student' do
    student = @room.students.create(number: '2019E9876543213',
                                    password: '123456',
                                    name: '王五',
                                    gender: 'male',
                                    team_id: @team.id,
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
