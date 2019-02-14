class UsersController < ApplicationController
  layout 'authentication'
  before_action :user_log_in?

  def index
    @users = User.all
  end

  def add_nickname
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      redirect_back(fallback_location: posts_path)
    end
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
    @user = User.find(params[:id])
    @users = @user.follows
    render :index
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render :index
  end

  def delete_avatar
    @avatar = ActiveStorage::Attachment.find_by(id: params[:upload_id])
    @avatar.purge
    redirect_back(fallback_location: posts_path)
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end
end
