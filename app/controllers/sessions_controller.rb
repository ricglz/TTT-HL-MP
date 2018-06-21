class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.password == params[:session][:password]
      flash[:success] = t('messages.login_successful')
      redirect_to success_path
    else
      flash[:error] = user ? t('messages.incorrect_password') : t('messages.user_unexistant')
      render 'new'
    end
  end
end
