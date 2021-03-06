# frozen_string_literal: true

class CommentsController < ApplicationController
  layout 'authentication'
  before_action :user_log_in?

  def new; end

  def create
    @post = Post.find(params[:post_id])
    @parent_comment_id = comment_params[:parent_id].empty? ? 0 : comment_params[:parent_id]
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @commentable }
        format.js {}
      end
    else
      redirect_to @commentable, alert: 'Something wrong'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
