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

  	def sort
  		@users = User.find(:all)
  		@users.sort! { |a,b| a.firstname.downcase <=> b.firstname.downcase }
  	end	

  	private
  		def user_params
    		params.require(:user).permit(:firstname, :lastname, :email, :password)
  		end
end
