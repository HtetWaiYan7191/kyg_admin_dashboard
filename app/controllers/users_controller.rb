class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]
  def index
    @users = User.all 
  end

  def show
  end

  def new 

  end

  def create
    
  end

  def edit 

  end

  def update 

  end

  def create
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
