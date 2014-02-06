class UsersController < ApplicationController
  def create
    @users = Users.new(user_params)
    if @users.save
      sign_in @users
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @users
    else
      render 'new'
    end
  end
end