class WallController < ApplicationController
 
	def index
		@posts = Post.all
	end
	
	def create
    	@post = Post.new(post_params)
		@post.save

  		redirect_to wall_url(@post)
    end

    def show
		@post = Post.find(params[:id])
	end
	
	def edit
        @post = Post.find(params[:id])
	end

	def update
        @post = Post.find(params[:id])
 
    if @post.update(post_params)
       redirect_to wall_url(@post)
    else
       render 'edit'
    end
	end


	def destroy
        @post = Post.find(params[:id])
  	    @post.destroy
 
        redirect_to wall_url(@post)
	end


    private
    def post_params
    	params.require(:post).permit(:title, :content)
    end

end
