require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get signUp" do
    get :signUp
    assert_response :success
  end

  test "should get logIn" do
    get :logIn
    assert_response :success
  end

end
