# frozen_string_literal: true

class PostsController < ApplicationController
  layout 'authentication'

  before_action :user_log_in?
  before_action :set_post, only: %i[show edit update destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      upload_attachment
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def index
    id = current_user.follows
    posts_of_friends = Post.of_followed_users(id)
    my_posts = current_user.posts
    @posts = posts_of_friends + my_posts
    @posts.sort! { |a, b| b[:created_at] <=> a[:created_at] }
  end

  def edit; end

  def update
    if @post.update(post_params)
      upload_attachment
      redirect_to user_path(@post.user)
    else
      render :edit
    end
  end

  def hashtags
    tag = Tag.find_by(name: params[:name].downcase)

    @posts = tag.posts.order('created_at DESC')
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :user_id, :attachment)
  end

  def upload_attachment
    @post.attachment.attach(uploaded_file) if uploaded_file.present?
  end

  def uploaded_file
    params[:post][:attachment]
  end
end
