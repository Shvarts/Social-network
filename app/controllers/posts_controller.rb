class PostsController < ApplicationController
	
	def create
		@posts = Post.all
    	@post = Post.create(post_params)
    	render partial: "posts_home"
  	end

	def update
		@posts = Post.all
	    @post = Post.find(params[:id])

	    if  @post.update(post_params)
	        render partial: "posts_home"
	    else 
	    	render text: "Erorr_update_controller"
	    end
	end


	def destroy
		@posts = Post.all
        @post = Post.find(params[:id])
  	    @post.destroy
  	    render partial: "posts_home"
	end


private

  	def post_params
    	params.permit(:title, :content)
  	end

end
