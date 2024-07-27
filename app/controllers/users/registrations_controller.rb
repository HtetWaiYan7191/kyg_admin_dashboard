# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def new
    if current_user && current_user.admin?
    super
    else
       redirect_to root_path, alert: 'You do not have permission to access this page'
    end
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :password_confirmation, :change_password])
  end

  private 

  def update_resource(resource, params)
    @is_password_changed = resource.change_password 
    # if change_password true means user already changed the password and now need to 
    # add the current_password to change password again
    if resource.change_password && resource.update_with_password(params)
      true
    # user did not change the default password sceniro 
    # user does not need to add the current password 
    elsif !resource.change_password && resource.update(password: params[:password], password_confirmation: params[:password_confirmation])
      resource.update(change_password: true) unless resource.change_password
      true
    else  
      resource.errors.full_messages.each do |msg| 
        flash[:alert] = msg
      end
      false
    end
  end

  def after_update_path_for(resource)
    unless resource.change_password
      sign_out(resource)
      edit_user_registration_path
    else  
      flash[:notice] = "password updated successfully"
      user_path(resource)
    end
  end





  


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
