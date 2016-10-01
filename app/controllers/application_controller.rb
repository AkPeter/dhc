class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :remember_me])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:login, :username, :email, :password, :remember_me])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password])

    added_attrs = [:username, :email, :password, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
