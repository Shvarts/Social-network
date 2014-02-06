module SessionsHelper

  def sign_in(users)
    remember_token = Users.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    users.update_attribute(:remember_token, Users.encrypt(remember_token))
    self.current_user = users

  def current_user=(users)
    @current_user = users

  def signed_in?
    !current_user.nil?

  def current_user
    remember_token = Users.encrypt(cookies[:remember_token])
    @current_user ||= Users.find_by(remember_token: remember_token)

  def sign_out
    @current_user.update_attribute(:remember_token,
                                  Users.encrypt(Users.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  end
  end
  end
  end
end
