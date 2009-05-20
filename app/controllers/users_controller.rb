class UsersController < ApplicationController
  
  def show
    @user = User.find_by_login! params[:login], :include => :tweets
  end
  
end
