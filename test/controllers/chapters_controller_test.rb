require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post session_path, params: { email_address: @user.email_address, password: "password" }
  end

  test "should get new" do
    get new_chapter_url
    assert_response :success
  end

  test "should create chapter" do
    assert_difference("Chapter.count") do
      post chapters_url, params: { chapter: { title: "Test Chapter", description: "This is a test chapter.", start_date: "2026-03-23", end_date: "2026-03-30", published: true } }
    end

    assert_redirected_to timeline_url
  end

  test "should create chapter and return turbo_stream" do
    assert_difference("Chapter.count") do
      post chapters_url, params: { chapter: { title: "Test Chapter", description: "This is a test chapter.", start_date: "2026-03-23", end_date: "2026-03-30", published: true } }, as: :turbo_stream
    end

    assert_response :success
    assert_equal "text/vnd.turbo-stream.html", @response.media_type
  end
end
