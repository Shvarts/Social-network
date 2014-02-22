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
    puts '++++++++++++++++++++++++++++++='
    puts params.inspect
    puts '++++++++++++++++++++++++++++++='
    @post = Post.create(post_params)
    @posts = [@post]
    render partial: "posts_home"
  end

	def update
	    @post = Post.find(post_params[:id])
      @posts = [@post]
		@post.update(post_params)
	    render partial: "posts_home"
	end


	def destroy
    @posts = []
        @post = Post.find(params[:id])
  	    @post.destroy
  	    render partial: "posts_home"
	end


private

  	def post_params
    	params.require(:post).permit(:title, :content, :id, :photo)
  	end

end
