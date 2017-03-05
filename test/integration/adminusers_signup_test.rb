require 'test_helper'

class AdminusersSignupTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get adminusers_new_path
    assert_no_difference 'Adminuser.count' do
      post adminusers_path, params: { adminuser: { username:  "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end
    follow_redirect!
    assert_template 'adminusers/show'
    assert_not flash

  end
end
