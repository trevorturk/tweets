require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "show" do
    get :show, :login => User.make.login
    assert_response :success
  end

end
