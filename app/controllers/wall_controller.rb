class WallController < ApplicationController
  def index
    @wallList = Wall.all
  end
  
  def walllist_ajax
    @wallList = Wall.where("`post` LIKE ?", params[:q]+"%")
	render :partial => 'walllist_ajax'
	#render json: @wallList
  end
  
end
