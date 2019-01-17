class UsersController < ApplicationController
   before_action :authenticate_user!

   def index
     @users = User.all
   end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def likes_toggle
    post = Post.find_by(id: params[:post_id])

      current_user.liked_posts << post

    redirect_back(fallback_location: posts_path)
  end

  def follow_toggle
    user = User.find_by(id: params[:user_id])
    if current_user.follows.include?(user)
      current_user.follows.delete(user)
    else
      current_user.follows << user
    end
    redirect_back(fallback_location: posts_path)
  end

  def follows
    @users = current_user.follows
    render :index
  end

  def followers
    @users = current_user.followers
    render :index
  end
end
