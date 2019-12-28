require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test 'valid team' do
    team = Team.new(name: '20190608',
                    department: '计算机学院')
    assert team.save
  end

  test 'should not save team when team name exist' do
    team = Team.new(name: '20190708',
                    department: '计算机学院')
    assert_not team.save
  end
end
