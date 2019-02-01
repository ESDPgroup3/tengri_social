require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get show to redirect" do
    get "/posts/1"
    assert_response :redirect
  end

  test "should get destroy to redirect" do
    delete "/posts/1"
    assert_response :redirect
  end

  test "should get new to redirect" do
    get "/posts/new"
    assert_response :redirect
  end

  test "should get create to redirect" do
    post "/posts"
    assert_response :redirect
  end

  test "should get index to redirect" do
    get "/posts"
    assert_response :redirect
  end
end
