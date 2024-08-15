class ApplicationController < ActionController::Base
    include KygAuthenticationConcern
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

    def after_sign_in_path_for(resource)
      if resource.admin?        
        if resource.change_password 
          authenticated_root_path
        else  
          edit_user_registration_path
        end
        # if resource.change_password
        #   redirect_to authenticated_root_path and return
        # else
        #   redirect_to edit_user_registration_path and return
        # end
      elsif resource.management?
        if resource.change_password
          management_root_path
        else 
          edit_user_registration_path
        end
        # if resource.change_password
        #   redirect_to management_root_path and return
        # else
        #   redirect_to edit_user_registration_path and return
        # end
      else
        root_path
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
