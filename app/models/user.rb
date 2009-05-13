class User < ActiveRecord::Base
  
  validates_presence_of :login
  
  def to_s
    login
  end
  
end
