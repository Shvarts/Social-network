class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.create(params[:user])
  		render text: "#{@user.id}:#{@user.firstname}(#{!@user.new_record?})"
  	end
end
