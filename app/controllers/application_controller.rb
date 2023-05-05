class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # Devise::Controllers::Helpers
  before_action :authenticate_user!
  # before_action :authenticate_user!, excep: %i[index ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
