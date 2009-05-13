require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "User.make" do
    assert_difference 'User.count' do
      User.make
    end
  end

  test "requires login" do
    assert_no_difference 'User.count' do
      u = User.create(:login => nil)
      assert u.errors.on(:login)
    end
  end
  
  test "to_s" do
    u = User.make
    assert_equal u.login, u.to_s
  end

end
