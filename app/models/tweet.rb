class Tweet < ActiveRecord::Base
  
  attr_accessible :body
  
  belongs_to :user
  
  validates_presence_of :body, :user_id
  validates_length_of :body, :within => 1..140
  
  def to_s
    body
  end
  
end
