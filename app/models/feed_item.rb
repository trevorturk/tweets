class FeedItem < ActiveRecord::Base
  
  attr_accessible
  
  belongs_to :user
  belongs_to :tweet
  belongs_to :tweet_user, :foreign_key => 'tweet_user_id', :class_name => 'User'
  
  validates_presence_of :user_id, :tweet_id, :tweet_user_id, :tweet_created_at
  
end
