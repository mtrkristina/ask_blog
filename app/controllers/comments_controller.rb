# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    params[:comment][:user_id] = current_user.id
    comment = Comment.create(comment_params)
    if comment.save
      pp current_user.favourites.exists?(question_id: comment.question_id)
      unless current_user.favourites.exists?(question_id: comment.question_id)
        Favourite.create(user: current_user, question: comment.question)
      end
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
