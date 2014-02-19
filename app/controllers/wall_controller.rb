class WallController < ApplicationController
 
	def index

		@posts = Post.all
		@posts = Post.paginate(:page => params[:page], :per_page => 5)
        @post = Post.new

	end

end
