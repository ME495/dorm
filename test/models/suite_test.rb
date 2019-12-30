require 'test_helper'

class SuiteTest < ActiveSupport::TestCase
  test 'valid suite' do
    suite = Suite.new(name: '雁5-151',
                      apartment: '雁5',
                      unit: 1,
                      floor: 5,
                      number: 1,
                      gender: 'male',
                      layout: 0)
    assert suite.save
  end

  test 'should not save suite when gender is not in {"male", "female"}' do
    suite = Suite.new(name: '雁5-151',
                      apartment: '雁5',
                      unit: 1,
                      floor: 5,
                      number: 1,
                      gender: 'man',
                      layout: 0)
    assert_not suite.save
  end

  test 'should not save student when its name is exist' do
    suite = Suite.new(name: '雁5-153',
                      apartment: '雁5',
                      unit: 1,
                      floor: 5,
                      number: 3,
                      gender: 'male',
                      layout: 0)
    assert_not suite.save
  end
end
