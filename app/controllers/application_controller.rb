class ApplicationController < ActionController::Base
  # 未ログインの場合ログイン画面に送る
  before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resourse)
    flash[:notice] = "Welcome! You have signed up successfully."
    # サインイン後はどのページに遷移するか？引数設定忘れない！render
    user_path(current_user.id)
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

end
