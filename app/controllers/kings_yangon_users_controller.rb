class KingsYangonUsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:sign_in_page]
  def sign_up
  end

  def sign_in_page
  end

  def sign_in 
    @user = KingsYangonUser.find_by(school_id: params[:school_id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to landing_page_index_path, notice: ' Welcome to our page'
    else  
      redirect_to sign_in_page_kings_yangon_users_path, alert: 'Invalid School ID or password'
    end
  end

  def create
    
  end

  def log_out
    session[:user_id] = nil
    redirect_to sign_in_page_kings_yangon_users_path, notice: 'Signed out successfully'
  end
end
