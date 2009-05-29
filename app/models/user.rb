class User < ActiveRecord::Base
  
  attr_accessible :login
  
  has_many :feed_items
  has_many :tweets
  
  has_many :follows_where_they_are_doing_the_following, :foreign_key => :follower_id, :class_name => 'Follow'
  has_many :followings, :through => :follows_where_they_are_doing_the_following
  
  has_many :follows_where_they_are_being_followed, :foreign_key => :following_id, :class_name => 'Follow'
  has_many :followers, :through => :follows_where_they_are_being_followed
  
  validates_presence_of :login
  validates_length_of :login, :within => 1..15
  
  def follow(user)
    Follow.create {|r| r.follower = self; r.following = user}
  end
  
  def unfollow(user)
    Follow.find_by_follower_id_and_following_id(self.id, user.id).destroy rescue nil
  end
  
  def to_param
    login
  end
  
  def to_s
    login
  end
  
end
