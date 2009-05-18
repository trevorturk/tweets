class HomeController < ApplicationController
  
  def index
    @tweets = Tweet.all :include => :user
    @users = User.all
  end
  
end
