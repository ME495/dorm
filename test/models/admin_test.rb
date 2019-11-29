require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'valid admin' do
    admin = Admin.new(account: 'admin3',
                      password: '123456',
                      email: 'admin3@example.com')
    assert admin.save
  end

  test 'should not save admin without password' do
    admin = Admin.new(account: 'admin3',
                      email: 'admin3@example.com')
    assert_not admin.save
  end

  test 'shoule not save admin with invalid email' do
    admin = Admin.new(account: 'admin3',
                      password: '123456',
                      email: 'aaaaaaa')
    assert_not admin.save
  end

  test 'should not save admin with exist account' do
    admin = Admin.new(account: 'admin1',
                      password: '123456',
                      email: 'admin3@example.com')
    assert_not admin.save
  end
end
