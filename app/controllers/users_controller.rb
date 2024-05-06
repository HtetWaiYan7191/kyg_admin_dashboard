class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index  
    @users = User.all 
  end

  def show
  end 

  def new 
    @user = User.new 
  end

  def create
    puts 'create method is working'
    @user = User.new(user_params_create)
    if @user.save 
      redirect_to users_path, notice: 'User created successfully'
    else 
      redirect_to new_user_path, alert: @user.errors.full_messages
    end
  end

  def edit 

  end

  def update 
    puts 'this is update method'
    if @user.update(user_params)
      redirect_to users_path, notice: 'User updated successfully' 
    else  
      redirect_to edit_user_path(id: current_user.id), alert: @user.errors.full_messages
    end
  end

  def destroy
    puts 'this is destroy method working'
    if @user.destroy 
      redirect_to users_path, notice: "User deleted successfully"
    else 
      redirect_to users_path, alert: 'User cannot be deleted'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params 
    params.require(:user).permit(:name, :email, :department, :role, :position, :title )
  end

  def user_params_create
    params.permit(:name, :email, :password, :department, :role, :position, :title)
  end
end
