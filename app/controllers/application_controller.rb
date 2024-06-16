class ApplicationController < ActionController::Base
    include KygAuthenticationConcern
    before_action :configure_permitted_parameters, if: :devise_controller?
    load_and_authorize_resource
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

    def after_sign_in_path_for(resource)
      if resource.admin?
        home_page_path
      elsif resource.management?
        brand_categories_path
      end
    end

    rescue_from CanCan::AccessDenied do |exception|
      exception.default_message = "You are not authorized to perform this task"
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
end
