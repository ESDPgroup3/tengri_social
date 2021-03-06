# frozen_string_literal: true

module CommentsHelper
  def reply_comment_to_id(comment, nesting, max_nesting)
    if max_nesting.blank? || nesting < max_nesting
      comment.id
    else
      comment.parent_id
    end
  end
end
