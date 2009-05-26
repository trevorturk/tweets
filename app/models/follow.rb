class Follow < ActiveRecord::Base
  
  attr_accessible
  
  belongs_to :follower, :foreign_key => :follower_id, :class_name => 'User'
  belongs_to :following, :foreign_key => :following_id, :class_name => 'User'
  
  validates_presence_of :follower_id
  validates_presence_of :following_id
  validates_uniqueness_of :following_id, :scope => :follower_id
  validate :cannot_follow_self
  
  # after_create :create_feed_items_for_follower_with_items_created_by_user_being_followed
  # after_destroy :destroy_feed_items_for_follower_that_were_created_by_followed_user
  
  def cannot_follow_self
    errors.add(:following_id) if follower == following
  end
  
  # def create_feed_items_for_follower_with_items_created_by_user_being_followed
  #   following.tweets.find_each do |item|
  #     follower.feed_item.create!
  #   end
  # end
  
end
