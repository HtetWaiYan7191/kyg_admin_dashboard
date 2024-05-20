require "test_helper"

class KingsYangonUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get kings_yangon_users_sign_up_url
    assert_response :success
  end

  test "should get log_in" do
    get kings_yangon_users_log_in_url
    assert_response :success
  end

  test "should get log_out" do
    get kings_yangon_users_log_out_url
    assert_response :success
  end
end
