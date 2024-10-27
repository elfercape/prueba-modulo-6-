class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def authorize_request(kind = nil)
    unless kind.include?(current_user.role)
      redirect_to offers_path, notice: "No está autorizado para realizar esta acción"
    end
  end
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role, :curriculum, :picture])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :role, :curriculum, :picture])
    end
  

end
