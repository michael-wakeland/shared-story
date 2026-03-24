require "test_helper"

class TimelineControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # assuming a user fixture exists
    post session_path, params: { email_address: @user.email_address, password: "password" }
  end

  test "should get index" do
    get timeline_url
    assert_response :success
  end
end
