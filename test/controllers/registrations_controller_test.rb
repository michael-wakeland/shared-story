require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should get create" do
    post registration_url, params: { user: { email_address: "newuser@example.com", password: "password", password_confirmation: "password" } }
    assert_redirected_to timeline_path
  end
end
