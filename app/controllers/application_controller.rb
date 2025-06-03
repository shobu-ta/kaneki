class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # 新規登録後のリダイレクト先
  def after_sign_up_path_for(resource)
    users_mypage_path
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if (resource.class.to_s == "Admin")
      admin_root_path
    else
      users_mypage_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar, :name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :name, :phone_number])
  end
end