class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    current_user.applies.create(room_id: apply_params[:room_id])
    redirect_to room_path(apply_params[:room_id])
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname])
  end

  def apply_params
    params.permit(:room_id)
  end
end
