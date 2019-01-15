class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    upload_picture
    if @post.save 
      redirect_to user_path(@post.user)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all 
  end

  def update
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
   
      end 
  end

  def destroy
    @post = Post.destroy(params[:id])
    redirect_to user_path(current_user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description ,:user_id, :picture)
  end

  def upload_picture
    @post.picture.attach(uploaded_file) if uploaded_file.present?
  end
    
  def uploaded_file
    params[:post][:picture]
  end
end
