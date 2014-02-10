class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to admin_users_path    
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password)
    end
end