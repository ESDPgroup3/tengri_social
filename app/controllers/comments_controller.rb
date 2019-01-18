class CommentsController < ApplicationController
    layout 'authentication'
  before_action :user_log_in?
	def new
		
	end

	def create
		comment = Comment.new(comment_params)
		comment.user = current_user

		comment.save

		redirect_to posts_path(comment.user)
	end

	private

	def comment_params
		params.require(:comment).permit(:post_id, :body)
	end
end
