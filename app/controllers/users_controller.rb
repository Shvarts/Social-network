class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			sign_in(@user)
			redirect_to profile_path(current_user)			
		else
			render "new"
		end
  end

  def profile
#  	if params[:user]
 # 		@user = User.find(:id => params[:user][:id])
  #	else
  		@user = current_user
  #	end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :avatar)
  end

end
