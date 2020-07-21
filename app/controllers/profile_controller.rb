# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @questions = user.questions
    @favourite_questions = user.favourite_questions
  end

  private

  def user
    @user ||= current_user
  end
end
