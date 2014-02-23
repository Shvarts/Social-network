class UsersController < ApplicationController
	load_and_authorize_resource

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
	    @user.roles << Role.find_by_name(:user)
		if @user.save
			redirect_to root_path
		else
			render "new"
		end
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :avatar)
  end

end
