require 'test_helper'

class PasswdControllerTest < ActionDispatch::IntegrationTest
  test "should get passwd" do
    get passwd_passwd_url
    assert_response :success
  end

end
