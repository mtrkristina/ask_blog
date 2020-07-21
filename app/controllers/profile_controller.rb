class ProfileController < ApplicationController
  before_action :authenticate_user!


  def show
    @questions = user.questions
  end

  private

  def user
    @user ||=current_user

  end
end
