class PostsController < ApplicationController
  layout 'authentication'
    before_action :user_log_in?
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
      redirect_to user_path(@post.user)
    else
      render 'new'
    end
  end

  def index
    id = current_user.follows << current_user
    # @posts = Post.of_followed_users(id).order('created_at DESC')
    @posts = Post.all
  end

  def edit
  end

  def update
      if @post.update(post_params)
        upload_attachment
        redirect_to user_path(@post.user)
      else
        render :edit
      end 
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
    params.require(:post).permit(:title, :description ,:user_id, :attachment)
  end

  def upload_attachment
    @post.attachment.attach(uploaded_file) if uploaded_file.present?
  end

  def uploaded_file
    params[:post][:attachment]
  end
end
