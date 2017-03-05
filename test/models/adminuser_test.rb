require 'test_helper'

class AdminuserTest < ActiveSupport::TestCase

  def setup
    @adminuser = Adminuser.all
  end


  test 'should be valid'do
    assert @adminuser.valid?
  end

  test 'name should be present' do
    @adminuser.name = "     "
    assert_not @user.valid?
  end
  test 'name should not be too long'do
    @adminuser.name = 'a' * 51
    assert_not @adminuser.valid?
  end

  test 'email should not be too long' do
    @adminuser.email = 'a' * 244 + '@example.com' ##????need to solve
    assert_not @adminuser.valid?
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @adminuser.email = invalid_address
      assert_not @adminuser.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'password should be present (nonblank)' do
    @adminuser.password = @adminuser.password_confirmation = " " * 6
    assert_not @adminuser.valid?
  end

  test 'password should have a minimum length' do
    @adminuser.password = @adminuser.password_confirmation = "a" * 5
    assert_not @adminuser.valid?
  end

  test 'email should be present' do
    @adminuser.email = "     "
    assert_not @adminuser.valid?
  end

  test 'email addresses should be unique' do
    duplicate_user = @adminuser.dup
    duplicate_user.email = @adminuser.email.upcase
    @adminuser.save
    assert_not duplicate_user.valid?
  end
  private
  def adminusers_params
    params.require(:adminuser).permit(:username, :email, :password, :password_confirmation)
  end
end
