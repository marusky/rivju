class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:invite, keys: [:type, :classroom_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :classroom_id])
  end
end
