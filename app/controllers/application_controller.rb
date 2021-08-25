class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    current_user.applies.create(room_id: apply_params[:room_id])
    redirect_to room_path(apply_params[:room_id])
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname])
  end

  def apply_params
    params.permit(:room_id)
  end
end
