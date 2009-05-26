class Tweet < ActiveRecord::Base
  
  attr_accessible :body
  
  belongs_to :user
  
  validates_presence_of :body, :user_id
  validates_length_of :body, :within => 1..140
  
  after_create :create_feed_items
  
  def create_feed_items
    FeedItem.populate(self)
  end
  
  def to_s
    body
  end
  
end
