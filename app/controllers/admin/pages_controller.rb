class Admin::PagesController < ApplicationController
  before_filter :authorize_parent

  def index
  	@users = User.all
  end
  def user_search
		@users = User.where("firstname like ?","%#{params["params"]}%") 
		render partial: "users/user_list"
  end
  layout "admin"

  private
	def authorize_parent
		if current_user.blank? or !current_user.role? :admin 
		  	redirect_to root_url
	  	end
	end

end
