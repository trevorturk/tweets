class User < ActiveRecord::Base
  
  attr_accessible :login
  
  has_many :tweets

  has_many :followers, :through => :follower_followings
  has_many :followees, :through => :followee_followings
  
  has_many :follower_followings, :foreign_key => :follower_id, :class_name => 'User'
  has_many :followee_followings, :foreign_key => :followee_id, :class_name => 'User'
  
  validates_presence_of :login
  validates_length_of :login, :within => 1..15
  
  def to_param
    login
  end
  
  def to_s
    login
  end
  
end
