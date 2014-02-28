class WallController < ApplicationController
 
	def index

		@posts = Post.paginate(:page => params[:page], :per_page => 5).order('created_at desc')
        @post = Post.new

	end

  def ajax_read
    @posts = Post.where("`content` LIKE ?", '%'+params[:q]+'%')
    render :partial => 'posts/posts_home'
    #respond_to do |format|
    #  format.json { render json: @wallList, status: :serached, location: @wallList }
    #end
  end
end
