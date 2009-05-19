require 'test_helper'

class FollowshipTest < ActiveSupport::TestCase

  test "Followship.make" do
    assert_difference 'Followship.count' do
      Followship.make
    end
  end

  test "requires user_id" do
    assert_no_difference 'Followship.count' do
      f = Followship.create
      assert f.errors.on(:user_id)
    end
  end
  
  test "requires following_id" do
    assert_no_difference 'Followship.count' do
      f = Followship.create
      assert f.errors.on(:following_id)
    end
  end
  
  test "belongs to user" do
    u = User.make
    r = Followship.make(:user_id => u.id)
    assert r.user = u
  end
  
end
