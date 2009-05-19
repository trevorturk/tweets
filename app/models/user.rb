class User < ActiveRecord::Base
  
  attr_accessible :login
  
  has_many :tweets
  has_many :followships
  # has_many :followings, :through => :followings, :foreign_key => :following_id, :source => :user
  # has_many :followers, :through => :followings, :foreign_key => :following_id, :source => :user
  
  validates_presence_of :login
  validates_length_of :login, :within => 1..15
  
  def to_param
    login
  end
  
  def to_s
    login
  end
  
end
