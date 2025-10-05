class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramters, if: :devise_controller?

  protected

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :pet_type, :pet_name, :bio, :is_active])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :pet_type, :pet_name, :bio, :is_active])
  end

end
