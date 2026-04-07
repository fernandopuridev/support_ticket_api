class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def require_admin!
    render json: { error: "Acesso não autorizado" }, status: :forbidden unless current_user.admin?
  end

  def require_owner_or_admin!(ticket)
    return if current_user.admin?
    return if ticket.user == current_user
    render json: { error: "Acesso não autorizado" }, status: :forbidden
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
