require 'test_helper'

class FollowTest < ActiveSupport::TestCase

  test "Follow.make" do
    assert_difference 'Follow.count' do
      Follow.make
    end
  end

  test "requires follower_id, following_id" do
    assert_no_difference 'Follow.count' do
      r = Follow.create
      assert r.errors.on(:following_id)
      assert r.errors.on(:follower_id)
    end
  end
      
end
