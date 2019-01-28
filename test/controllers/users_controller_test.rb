require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show to redirect" do
    get "/users/1"
    assert_response :redirect
  end

  test "should get index to redirect" do
    get "/users"
    assert_response :redirect
  end
end
