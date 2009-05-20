require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "show" do
    get :show, :login => User.make.login
    assert_response :success
  end
  
  test "show with other stuff going on" do
    user1 = User.make
    user2 = User.make
    Tweet.make(:user_id => user1.id)
    Tweet.make(:user_id => user2.id)
    user1.follow(user2)
    user2.follow(user1)
    get :show, :login => user1.login
    assert_response :success
  end

end
