class FeedItem < ActiveRecord::Base
  
  attr_accessible
  
  belongs_to :user
  
  has_one :tweet
  has_one :tweet_user 
  
  validates_presence_of :user_id, :tweet_id, :tweet_user_id, :tweet_created_at
  
end
