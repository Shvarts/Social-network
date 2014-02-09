class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to admin_users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to admin_users_path
  end


  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password)
    end
end
