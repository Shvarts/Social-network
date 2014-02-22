class WallController < ApplicationController
 
	def index

		@posts = Post.paginate(:page => params[:page], :per_page => 5).order('created_at desc')
        @post = Post.new

	end

end
