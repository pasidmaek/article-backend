class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: { data: @posts.as_json(include: { user: { only: [:id, :name] } })}
  end
  
  def show_my_posts
    @posts = current_user.posts
    if @posts.any?
      render json: { data: @posts.as_json(include: { user: { only: [:id, :name] } })}
    else
      render json: { data: [], error: "No data" }, status: :ok
    end
    # render json: @posts.as_json(include: { user: { only: [:id, :name] } })
  end
  
  def show
    @post = Post.find(params[:id])
    render json: { data: @post.as_json(include: { user: { only: [:id, :name] } })}
  end

  def create
    @post = Post.new(valid_params.merge(user: current_user))
    if @post.save
      render json: {message: "Success", data: @post.as_json(include: { user: { only: [:id, :name] } })}, status: 200
    else
      render json: {message: "Error", error: @post.errors}, status: :unprocessable_entity
    end
  end
  
  def update
    @post = Post.find(params[:id])
    puts params[:id]
    if @post
      @post.update(valid_params)
      # render json: {message: "Post updated"}, status: 200
      render json: {message: "Post updated", data: @post.as_json(include: { user: { only: [:id, :name] } })}, status: 200
    else
      render json: {error: "Unable to update"}, status: 500
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post && @post.user == current_user
      @post.destroy
      render json: { message: "{Post} destroyed" }, status: 200
    else
      render json: { error: "Unauthorized or unable to destroy" }, status: 403
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Post not found" }, status: :not_found
  end

  def valid_params
    params.require(:post).permit(:title, :body)
  end
  
end
