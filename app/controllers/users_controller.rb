class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :check_admin_access

  def index  
    unless params[:query]
      @users = User.all.order(:name).page(params[:page]).per(4)
    else  
      @users = User.where("name LIKE ?", "%#{params[:query]}%").order(:name).page(params[:page]).per(4)
    end
  end

  def show
  end 

  def new 
    @user = User.new 
  end

  def create
    @user = User.create_with_default_password(user_params_create)
    if @user.save 
      redirect_to users_path, notice: 'User created successfully'
    else
       flash.now[:alert] = 'User cannot be created'
       render :new, status: :unprocessable_entity
    end
  end

  def edit 

  end

  def update 
    if @user.update(user_params)
      redirect_to users_path, notice: 'User updated successfully' 
    else  
      redirect_to edit_user_path(id: current_user.id), alert: @user.errors.full_messages
    end
  end

  def destroy
    if @user.destroy 
      redirect_to users_path, notice: "User deleted successfully"
    else 
      redirect_to users_path, alert: 'User cannot be deleted'
    end
  end

  private
  def set_user
    @user = User.select('id, email, name, department, title, position, role, created_at, updated_at').find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name, :email, :department, :role, :position, :title )
  end

  def user_params_create
    params.require(:user).permit(:name, :email, :department, :title, :position, :role)
  end
end 
