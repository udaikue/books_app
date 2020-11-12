# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  # ログインしていなければログイン画面にリダイレクト
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :logged_in?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def after_sign_in_path_for(_)
    # ログイン後に遷移するpathを設定
    users_path
  end

  def after_sign_out_path_for(_)
    # ログアウト後に遷移するpathを設定
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
        :username,
        :email,
        :zipcode,
        :address,
        :profile
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
        :username,
        :email,
        :zipcode,
        :address,
        :profile
    ])
  end

  private

  def logged_in?
    !!session[:user_id]
  end
end
