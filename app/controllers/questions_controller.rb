# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
end

  def create
    @question = Question.new(question_params)
    question.user = current_user
    if @question.save
      redirect_to @question
    else
      render 'new'

    end
end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end

  def favourite
    if select = current_user.favourites.find_by(question_id: question.id)
      select.destroy
    else
      Favourite.create(user: current_user, question: question)
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end

  def question
    @question ||= Question.find(params[:id])
  end
end
