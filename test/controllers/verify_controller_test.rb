require 'test_helper'

class VerifyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get verify_new_url
    assert_response :success
  end

  test "should get create" do
    get verify_create_url
    assert_response :success
  end

  test "should get send" do
    get verify_send_url
    assert_response :success
  end

  test "should get receive" do
    get verify_receive_url
    assert_response :success
  end

end
