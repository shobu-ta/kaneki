class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # 新規登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    users_mypage_path
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    users_mypage_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end