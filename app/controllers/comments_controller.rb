class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.create(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to @comment
    else
      redirect_to @comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :question_id)
  end
end
