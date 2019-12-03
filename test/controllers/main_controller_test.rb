require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get main_fetch_url
    assert_response :success
  end

end
