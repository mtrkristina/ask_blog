# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.create(comment_params)
    comment.user = current_user
    if comment.save

    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete if current_user.id == comment.user_id
    redirect_back(fallback_location: root_path)
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :question_id)
  end
end
