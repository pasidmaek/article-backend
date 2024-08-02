require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one) 
    @post = @user.posts.create!(title: 'Sample Post', body: 'Content for the post')
  end

  test "should get index" do
    get api_v1_posts_url
    assert_response :success
  end

  test "should show my posts" do
    sign_in @user 
    get mypost_api_v1_posts_url
    assert_response :success
  end

  test "should create post" do
    sign_in @user
    assert_difference('Post.count', 1) do
      post api_v1_posts_url, params: { post: { title: 'New Post', body: 'Content of the new post' } }
    end
    assert_response :success
    response_data = JSON.parse(@response.body)
    assert_equal 'Success', response_data['message']
    assert_equal 'New Post', response_data['data']['title']
    assert_equal @user.id, response_data['data']['user']['id']
  end

  test "should update post" do
    sign_in @user
    patch api_v1_post_url(@post), params: { post: { title: 'Updated Title', body: 'Updated content' } }, as: :json
    assert_response :success
    @post.reload
    assert_equal 'Updated Title', @post.title
  end

  test "should destroy post" do
    sign_in @user
    assert_difference('Post.count', -1) do
      delete api_v1_post_url(@post), as: :json
    end
    assert_response :success
  end
end
