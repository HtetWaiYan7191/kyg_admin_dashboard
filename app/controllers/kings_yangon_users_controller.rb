class KingsYangonUsersController < ApplicationController
  before_action :redirect_if_authenticated, only: [:sign_in_page]
  before_action :authenticate_user!, except: [:sign_in_page, :sign_in, :log_out]
  before_action :set_kings_yangon_user, only: [:show, :edit, :update, :destroy]
  def index 
    @kings_yangon_users = KingsYangonUser.all.page(params[:page]).per(4)
  end

  def show 

  end

  def new
    @kings_yangon_user = KingsYangonUser.new
  end

  def create
    @kings_yangon_user = KingsYangonUser.new(kings_yangon_user_params)
    if @kings_yangon_user.save 
      redirect_to kings_yangon_users_path, notice: 'User created successfully'
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit 

  end

  def update 
    if @kings_yangon_user.update(kings_yangon_user_params)
      redirect_to kings_yangon_users_path, notice: 'User updated successfully'
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @kings_yangon_user.destroy 
      redirect_to kings_yangon_users_path, notice: 'User deleted successfully'
    end
  end

  def sign_up
  end

  def sign_in_page
  end

  def sign_in 
    @user = KingsYangonUser.find_by(school_id: params[:school_id])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to landing_page_index_path
    else  
      redirect_to sign_in_page_kings_yangon_users_path, alert: 'Invalid School ID or password'
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out successfully'
  end

  private 
  def set_kings_yangon_user
    @kings_yangon_user = KingsYangonUser.find(params[:id])
  end

  def kings_yangon_user_params
    params.require(:kings_yangon_user).permit(:school_id, :password)
  end
end
