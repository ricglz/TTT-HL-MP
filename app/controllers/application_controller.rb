class ApplicationController < ActionController::Base
  before_action :set_locale

  include SessionsHelper

  def set_locale
    cookies[:locale] = params[:lang] if params[:lang].present?
    I18n.locale = cookies[:locale] if cookies[:locale] != ''
  end
end
