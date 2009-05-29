class Follow < ActiveRecord::Base
  
  attr_accessible
  
  belongs_to :follower, :class_name => 'User'
  belongs_to :following, :class_name => 'User'
  
  validates_presence_of :follower_id
  validates_presence_of :following_id
  validates_uniqueness_of :following_id, :scope => :follower_id
  validate :cannot_follow_self
  
  def cannot_follow_self
    errors.add(:following_id) if follower == following
  end
  
end
