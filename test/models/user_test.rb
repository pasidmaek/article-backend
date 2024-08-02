require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = @user.posts.create(title: 'Sample Post', body: 'Content for the post')
  end

  test "should not save user without email" do
    user = User.new(password: 'password123')
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without password" do
    user = User.new(email: 'test@example.com')
    assert_not user.save, "Saved the user without a password"
  end

  test "should save user with valid email and password" do
    user = User.new(email: 'test@example.com', password: 'password123')
    assert user.save, "Could not save the user with valid email and password"
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.save, "Saved a user with a duplicate email"
  end

end
