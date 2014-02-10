class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
		    UserMailer.registration_confirmation(@user).deliver
			redirect_to "/"
		else
			render "new"
		end
  	end
	
	def profile
	end
	
    def accept_email
        @user = User.find_by(EmailToken: params[:token])
        @user.EmailConfirm = true
		@user.save
        redirect_to root_url
    end

  	private
  		def user_params
    		params.require(:user).permit(:firstname, :lastname, :email, :password, :token)
  		end

end
