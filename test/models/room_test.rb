require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @team = Team.find(1)
    @suite = Suite.find(1)
  end

  test 'valid room' do
    room = @suite.rooms.create(name: '雁5-153-1',
                               capacity: 2,
                               amount: 0,
                               number: 1,
                               team_id: @team.id)
    assert room.save
  end

  test 'should not save room without name' do
    room = @suite.rooms.create(capacity: 2,
                               amount: 0,
                               number: 1,
                               team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room without capacity' do
    room = @suite.rooms.create(name: '雁5-153-1',
                               amount: 0,
                               number: 1,
                               team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room without suite' do
    room = Room.new(name: '雁5-153-1',
                    capacity: 2,
                    amount: 0,
                    number: 1,
                    team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room when capacity is not integer' do
    room = @suite.rooms.create(name: '雁5-153-1',
                               capacity: 2.5,
                               amount: 0,
                               number: 1,
                               team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room when capacity less than 0' do
    room = @suite.rooms.create(name: '雁5-153-1',
                               capacity: -2,
                               amount: 0,
                               number: 1,
                               team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room when amount less than 0' do
    room = @suite.rooms.create(name: '雁5-153-1',
                               capacity: 2,
                               amount: -1,
                               number: 1,
                               team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room when name is exist' do
    room = @suite.rooms.create(name: '雁5-153-3',
                               capacity: 2,
                               amount: 0,
                               number: 1,
                               team_id: @team.id)
    assert_not room.save
  end

  test 'should not save room when amount is greater than capacity' do
    room = Room.find(1)
    room.amount = 3
    assert_not room.save
  end
end
