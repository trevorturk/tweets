require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "show" do
    get :show, :login => User.make.login
    assert_response :success
  end
  
  test "show with tweets" do
    u = User.make
    Tweet.make(:user_id => u.id)
    get :show, :login => u.login
    assert_response :success
  end

end
