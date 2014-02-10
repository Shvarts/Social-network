class Admin::PagesController < ApplicationController
  def index
  	@users = User.all
  end
  def user_search
		@users = User.where("firstname like ?","%#{params["params"]}%") 
		render partial: "users/user_list"
  end
  layout "admin"
end
