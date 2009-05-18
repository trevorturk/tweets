require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "show" do
    get :show, :id => User.make.login
    assert_response :success
  end

end
