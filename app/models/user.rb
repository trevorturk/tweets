class User < ActiveRecord::Base
  
  attr_accessible :login
  
  has_many :tweets
  
  validates_presence_of :login
  validates_length_of :login, :within => 1..15
  
  def to_s
    login
  end
  
end
