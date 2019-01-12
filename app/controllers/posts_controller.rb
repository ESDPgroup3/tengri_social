class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def destroy

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save 
      redirect_to user_path(@post.user)
    else
      render 'new'
    end
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:title, :description ,:user_id, images:[])
  end
end
