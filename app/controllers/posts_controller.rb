class PostsController < ApplicationController
	
	def new
		@post = Post.new
		if params[:id] == "0"
			render partial: "post_new"
		else
			@post = Post.find(params[:id])
			render partial: "post_update"
		end
	end
	
	def create
		@posts = Post.all
    	@post = Post.create(post_params)
    	render partial: "posts_home"
  	end

	def update
		@posts = Post.all
	    @post = Post.find(post_params[:id])
		@post.update(post_params)
	    render partial: "posts_home"
	end


	def destroy
		@posts = Post.all
        @post = Post.find(params[:id])
  	    @post.destroy
  	    render partial: "posts_home"
	end


private

  	def post_params
    	params.require(:post).permit(:title, :content, :id)
  	end

end
