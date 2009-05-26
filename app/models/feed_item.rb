class FeedItem < ActiveRecord::Base
  
  attr_accessible
  
  belongs_to :user
  belongs_to :tweet
  belongs_to :tweet_user, :foreign_key => 'tweet_user_id', :class_name => 'User'
  
  validates_presence_of :user_id, :tweet_id, :tweet_user_id, :tweet_created_at
  validates_uniqueness_of :user_id, :scope => :tweet_id
  
  def self.populate(tweet)    
    users = []
    users << tweet.user # tweet creator
    unless tweet.user.followers.empty?
      tweet.user.followers.each do |follower|
        users << follower # tweet creator's followers
      end
    end
    users.each do |u|
      FeedItem.create { |f| f.user_id = u.id; f.tweet_id = tweet.id; f.tweet_user_id = tweet.user_id; f.tweet_created_at = tweet.created_at }
    end
  end
  
end
