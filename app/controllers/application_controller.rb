class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resourse)
    # サインイン後はどのページに遷移するか？引数設定忘れない！
    user_path(current_user.id)
    flash[:notice] = "Welcome! You have signed up successfully."
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resourrce)
    root_path
    flash[:notice] = "Signed out successfully."
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
