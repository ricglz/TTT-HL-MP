# frozen_string_literal: true

# Class that controls the user model
class UsersController < ApplicationController
  def new
    redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t('messages.sign_up_succesful')
      redirect_to log_in_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
