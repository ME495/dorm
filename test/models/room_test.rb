require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test 'valid room' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    floor: 5,
                    gender: 'male',
                    suite: '雁5-153')
    assert room.save
  end

  test 'should not save room without room_number' do
    room = Room.new(apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room without apartment' do
    room = Room.new(room_number: '雁5-153-1',
                    unit: 1,
                    capacity: 2,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room without unit' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    capacity: 2,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room without capacity' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room without floor' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room without suite' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    floor: 5)
    assert_not room.save
  end

  test 'should not save room when unit is not integer' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1.5,
                    capacity: 2,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room when capacity is not integer' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2.5,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room when floor is not integer' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    floor: 5.5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room when capacity less than 0' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: -1,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room when amount less than 0' do
    room = Room.new(room_number: '雁5-153-1',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    amount: -1,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room when room_number is exist' do
    room = Room.new(room_number: '雁5-153-3',
                    apartment: '雁5',
                    unit: 1,
                    capacity: 2,
                    amount: -1,
                    floor: 5,
                    suite: '雁5-153')
    assert_not room.save
  end

  test 'should not save room when amount is greater than capacity' do
    room = Room.find_by_room_number('雁5-153-3')
    room.amount = 3
    assert_not room.save
  end

  test 'should not save room when gender is not in {"male", "female"}' do
    room = Room.find_by_room_number('雁5-153-3')
    room.gender = 'man'
    assert_not room.save
  end
end
