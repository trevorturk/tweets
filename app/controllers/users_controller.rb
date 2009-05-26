class UsersController < ApplicationController
  
  def show
    @user = User.find_by_login! params[:login], :include => [:tweets, :followings, :followers]
    @feed_items = @user.feed_items :include => :tweets
  end
  
end
