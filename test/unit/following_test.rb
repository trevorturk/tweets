require 'test_helper'

class FollowingTest < ActiveSupport::TestCase

  test "Following.make" do
    assert_difference 'Following.count' do
      Following.make
    end
  end

  test "requires user_id" do
    assert_no_difference 'Following.count' do
      f = Following.create
      assert f.errors.on(:user_id)
    end
  end
  
  test "requires following_id" do
    assert_no_difference 'Following.count' do
      f = Following.create
      assert f.errors.on(:following_id)
    end
  end
  
  test "belongs to user" do
    u = User.make
    r = Following.make(:user_id => u.id)
    assert r.user = u
  end
  
end
