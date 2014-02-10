class SessionsController < ApplicationController

  def new
  end

 def create
    users = User.find_by(email: params[:session][:email].downcase)
    if users && users.authenticate(params[:session][:password])
      sign_in users
      redirect_to users
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end


    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url

 end

  def destroy
    sign_out
    redirect_to root_url

    session[:user_id] = nil
    redirect_to root_url
  end

end