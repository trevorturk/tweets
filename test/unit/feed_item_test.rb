require 'test_helper'

class FeedItemTest < ActiveSupport::TestCase
  
  test "FeedItem.make" do
    assert_difference 'FeedItem.count' do
      FeedItem.make
    end
  end
  
  test "belongs to user" do
    flunk
  end
  
  test "has one tweet" do
    flunk
  end
  
  test "has one tweet_user" do
    flunk
  end
  
  test "requires user" do
    flunk
  end
  
  test "requires tweet" do
    flunk
  end
  
  test "requires tweet_user" do
    flunk
  end
  
  test "item_created_at == tweet created_at" do
    flunk
  end
  
end
