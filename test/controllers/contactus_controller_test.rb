require 'test_helper'

class ContactusControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get contactus_new_url
    assert_response :success
  end

  test "should get create" do
    get contactus_create_url
    assert_response :success
  end

  test "should get show" do
    get contactus_show_url
    assert_response :success
  end

  test "should get update" do
    get contactus_update_url
    assert_response :success
  end

  test "should get edit" do
    get contactus_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get contactus_destroy_url
    assert_response :success
  end

  test "should get index" do
    get contactus_index_url
    assert_response :success
  end

end
