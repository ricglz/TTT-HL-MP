# frozen_string_literal: true

# Class that controls the session from the users
class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      succesful_login(user)
    else
      flash[:error] = error_message(user)
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def succesful_login(user)
    log_in user
    flash[:success] = t('messages.login_successful')
    redirect_to root_path
  end

  def error_message(user)
    user ? t('messages.incorrect_password') : t('messages.user_unexistant')
  end
end
