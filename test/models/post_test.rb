require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = Post.new(description: "Lorem ipsum", user_id: @user.id)
  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "user id should be present in post" do
    @post.user_id = nil
    assert_not @post.valid?
  end
end
