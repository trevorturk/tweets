require 'test_helper'

class FollowTest < ActiveSupport::TestCase

  test "Follow.make" do
    assert_difference 'Follow.count' do
      Follow.make
    end
  end

  test "requires follower_id" do
    assert_no_difference 'Follow.count' do
      f = Follow.create
      assert f.errors.on(:follower_id)
    end
  end
  
  test "requires following_id" do
    assert_no_difference 'Follow.count' do
      f = Follow.create
      assert f.errors.on(:following_id)
    end
  end
    
end
