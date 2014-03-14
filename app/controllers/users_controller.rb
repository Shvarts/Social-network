class UsersController < ApplicationController

  def index
    @users = User.all

  end

	def new
		@user = User.new
  end

  def show
    @user = current_user
    @friend = User.find_by_id(params[:id])
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
    @hide_edit_links = true
    @user = current_user

  end

  def edit_profile

    @user = current_user
  end

  def update
    @user = current_user
    us_params = user_edit_params.to_hash
    puts(@user.password)
    puts('-------------------------')
    if  us_params['password'].blank?
      us_params.delete 'password'
      us_params.delete 'password_confirmation'
    else
      if us_params['password'] != us_params['password_confirmation']
        flash[:success] = "Your password and it's checking must be identical"
      end
    end
    if @user.password == us_params['confirm_edit_pass']
      us_params.delete 'confirm_edit_pass'
      if @user.update_attributes(us_params)
        flash[:success] = "Profile updated"
        redirect_to edit_profile_path
      else
        redirect_to edit_profile_path
      end
    else
      flash[:success] = "wrong password"
      redirect_to edit_profile_path
    end
  end

  private

  def user_edit_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :confirm_edit_pass, :avatar)
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :avatar)
  end

end
