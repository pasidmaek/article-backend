require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "Test Post", body: "This is a test post naja.")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = "   "
    assert_not @post.valid?
  end
end
