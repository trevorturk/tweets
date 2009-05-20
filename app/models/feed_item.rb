class FeedItem < ActiveRecord::Base
  
  attr_accessible
  
  belongs_to :user
  
  has_one :tweet
  has_one :tweet_user
  
end
