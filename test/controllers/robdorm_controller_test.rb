require 'test_helper'

class RobdormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get robdorm_index_url
    assert_response :success
  end

end
