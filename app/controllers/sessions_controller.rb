class SessionsController < ApplicationController
  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = t('messages.login_successful')
      redirect_to root_path
    else
      flash[:error] = user ? t('messages.incorrect_password') : t('messages.user_unexistant')
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
