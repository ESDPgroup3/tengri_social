class CommentsController < ApplicationController
  layout 'authentication'
  before_action :user_log_in?

  def new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js
      end
    else
      redirect_to @commentable, alert: "Something wrong"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id,)
  end
end
