class SessionsController < ApplicationController

  def new
  end

 def create
    users = User.find_by(email: params[:session][:email].downcase)
    if users #&& users.authentificate(params[:session][:password])
      User.current = users
      sign_in users
      redirect_to profile_path(users)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end