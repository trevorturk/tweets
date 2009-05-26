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
    
  test "has many followings/followers" do
    user_doing_the_following = User.make
    user_being_followed = User.make
    Follow.make(:follower_id => user_doing_the_following.id, :following_id => user_being_followed.id)
    assert_equal [user_doing_the_following], user_being_followed.followers
    assert_equal [user_being_followed], user_doing_the_following.followings
  end
  
  test "follow" do
    user_doing_the_following = User.make
    user_being_followed = User.make
    assert_difference 'Follow.count' do
      user_doing_the_following.follow(user_being_followed)
      assert_equal [user_doing_the_following], user_being_followed.followers
      assert_equal [user_being_followed], user_doing_the_following.followings
    end
  end
  
  test "unfollow" do
    user1 = User.make
    user2 = User.make
    user1.follow(user2)
    assert_difference 'Follow.count', -1 do
      user1.unfollow(user2)
      assert_equal [], user1.followings
      assert_equal [], user2.followers
    end
  end
  
  test "follows are unique and attempts to create two followings doesn't bomb" do
    user1 = User.make
    user2 = User.make
    assert_difference 'Follow.count' do
      user1.follow(user2)
    end
    assert_no_difference 'Follow.count' do
      user1.follow(user2)
    end
  end
  
  test "can follow each other" do
    user1 = User.make
    user2 = User.make
    assert_difference 'Follow.count' do
      user1.follow(user2)
    end
    assert_difference 'Follow.count' do
      user2.follow(user1)
    end
  end
  
  test "cannot follow self but doesn't bomb" do
    user = User.make
    assert_nothing_raised do
      assert_no_difference 'Follow.count' do
        user.follow(user)
      end
    end
  end
  
  test "unfollow doesn't bomb if nothing found" do
    assert_nothing_raised do
      User.make.unfollow(User.make)
    end
  end
  
  test "has many feed_items" do
    u = User.make
    f = FeedItem.make(:user_id => u.id)
    assert_equal 1, u.feed_items.count
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
