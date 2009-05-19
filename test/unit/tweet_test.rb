require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  test "Tweet.make" do
    assert_difference 'Tweet.count' do
      Tweet.make
    end
  end
    
  test "requires body" do
    assert_no_difference 'Tweet.count' do
      t = Tweet.create(:body => nil)
      assert t.errors.on(:body)
    end
  end

  test "requires user" do
    assert_no_difference 'Tweet.count' do
      t = Tweet.create(:user_id => nil)
      assert t.errors.on(:user_id)
    end
  end
  
  test "body =< 140 characters" do
    assert_no_difference 'Tweet.count' do
      t = Tweet.create(:body => 'a' * 141)
      assert t.errors.on(:body)
    end
  end
  
  test "belongs to user" do
    u = User.make
    t = Tweet.make(:user_id => u.id)
    assert t.user = u
  end
  
  test "to_s" do
    r = Tweet.make
    assert_equal r.body, r.to_s
  end

end
