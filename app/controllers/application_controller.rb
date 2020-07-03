class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #サインイン後、どこの画面に遷移するのかを設定する必要がある。
  #上記と同じく、サインアウト後のridirect先を設定する必要がある。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_number, :address, :phone_number])
    #sign_up（新規会員登録）の際に必要なカラムを追加。
  end
end
