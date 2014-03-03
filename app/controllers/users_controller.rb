class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create
		if @user.save
			redirect_to root_path
		else
			render "new"
		end
  end

  def profile
    @user = current_user

  end

  def edit_profile

    @user = current_user
  end

  def update
    @user = current_user
    us_params = user_params.to_hash
    puts us_params['password']
    puts('-------------------')
    if  us_params['password'].blank?
      puts('+++++++++++++++++++++')
      us_params.delete 'password'
      us_params.delete 'password_confirmation'
    end



    if @user.update_attributes(us_params)
      flash[:success] = "Profile updated"
      render 'edit_profile'
    else
      render 'edit_profile'
    end

  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :avatar)
  end

end
