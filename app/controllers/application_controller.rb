class ApplicationController < ActionController::Base
    include KygAuthenticationConcern
    before_action :configure_permitted_parameters, if: :devise_controller?
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

end
