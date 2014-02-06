class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			redirect_to "/"
		else
			render "new"
		end
  	end
	
	def profile
	end

  	private
  		def user_params
    		params.require(:user).permit(:firstname, :lastname, :email, :password)
  		end

end