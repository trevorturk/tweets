class User < ActiveRecord::Base
  
  attr_accessible :login
  
  has_many :tweets
  
  has_many :records_where_they_are_doing_the_following, :foreign_key => :follower_id, :class_name => 'Follow'
  has_many :followings, :through => :records_where_they_are_doing_the_following
  
  has_many :records_where_they_are_being_followed, :foreign_key => :following_id, :class_name => 'Follow'
  has_many :followers, :through => :records_where_they_are_being_followed
  
  validates_presence_of :login
  validates_length_of :login, :within => 1..15
  
  def to_param
    login
  end
  
  def to_s
    login
  end
  
end
