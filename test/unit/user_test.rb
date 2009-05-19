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
  
  test "login =< 15 chars" do
    assert_no_difference 'User.count' do
      u = User.create(:login => 'a' * 16)
      assert u.errors.on(:login)
    end
  end
  
  test "has many tweets" do
    u = User.make
    r = Tweet.make(:user_id => u.id)
    assert_equal u.tweets, [r]
  end
  
  test "has many followings" do
    u = User.make
    r = Followship.make(:user_id => u.id)
    assert_equal u.followings, [r]
  end
  
  test "has many followers" do
    u = User.make
    r = Followship.make(:following_id => u.id)
    assert_equal u.followers, [r]
  end
  
  test "to_param" do
    u = User.make
    assert_equal u.login, u.to_param
  end
  
  test "to_s" do
    u = User.make
    assert_equal u.login, u.to_s
  end

end
