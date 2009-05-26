require 'test_helper'

class FeedItemTest < ActiveSupport::TestCase
  
  test "FeedItem.make" do
    assert_difference 'FeedItem.count' do
      FeedItem.make
    end
  end
    
  test "requires user_id, tweet_id, tweet_user_id, tweet_created_at" do
    assert_no_difference 'FeedItem.count' do
      r = FeedItem.create
      assert r.errors.on(:user_id)
      assert r.errors.on(:tweet_id)
      assert r.errors.on(:tweet_user_id)
      assert r.errors.on(:tweet_created_at)
    end
  end
    
  test "belongs to user" do
    u = User.make
    f = FeedItem.make(:user_id => u.id)
    assert f.user == u
  end
  
  test "has one tweet" do
    f = FeedItem.make
    assert_equal f.tweet.id, f.tweet_id
  end
  
  test "has one tweet_user" do
    f = FeedItem.make
    assert_equal f.tweet.user.id, f.tweet_user_id
  end
  
  test "tweet_created_at is created_at of tweet" do
    f = FeedItem.make
    assert_equal f.tweet.created_at, f.tweet_created_at
  end
  
end
