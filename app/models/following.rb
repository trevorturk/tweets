class Following < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :user_id
  validates_presence_of :following_id
  
end
