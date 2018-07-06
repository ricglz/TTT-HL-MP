# frozen_string_literal: true

# Module that provides helper functions focused on sessions
module SessionsHelper
  def log_in(user)
    cookies.signed[:user_id] = user.id
  end

  def current_user
    user_id = cookies.signed[:user_id]
    @current_user ||= User.find(user_id) if user_id
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.delete :user_id
    @current_user = nil
  end
end
