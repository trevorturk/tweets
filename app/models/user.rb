class User < ActiveRecord::Base
  
  attr_accessible :login
  
  has_many :tweets
  
  has_many :follower_records, :foreign_key => :follower_id, :class_name => 'Follow'
  has_many :followings, :through => :follower_records
  
  has_many :followed_records, :foreign_key => :following_id, :class_name => 'Follow'
  has_many :followers, :through => :followed_records
  
  validates_presence_of :login
  validates_length_of :login, :within => 1..15
  
  def to_param
    login
  end
  
  def to_s
    login
  end
  
end
