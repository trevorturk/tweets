require 'test_helper'

class FeedItemTest < ActiveSupport::TestCase
      
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
      
  test "tweet is added to tweet creator's feed items" do
    assert_difference 'Tweet.count' do
      assert_difference 'FeedItem.count' do
        t = Tweet.make
        u = t.user
        assert_equal [], u.followers
        assert_equal t, u.feed_items.first.tweet
      end
    end
  end
  
  test "same tweet can't be added to the same user's feed twice" do
    assert_difference 'FeedItem.count' do
      Tweet.make
    end
    existing = FeedItem.last
    assert_no_difference 'FeedItem.count' do
      assert_nothing_raised do
        FeedItem.create { |f| f.user = existing.user; f.tweet = existing.tweet; f.tweet_user = existing.tweet_user; f.created_at = existing.tweet.created_at }
      end
    end
  end
  
  test "tweet is added to tweet creator's followers feed items" do
    tweeter = User.make
    follower = User.make
    follower.follow(tweeter)
    assert_difference 'Tweet.count' do
      assert_difference 'FeedItem.count', 2 do
        t = tweeter.tweets.create!(:body => 'test') 
        assert_equal t, tweeter.feed_items.first.tweet
        assert_equal t, follower.feed_items.first.tweet
      end
    end
  end
    
end
