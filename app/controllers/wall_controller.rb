class WallController < ApplicationController
  def index
    @wallList = Wall.all
	puts "here!!!!!!!!!"
  end
  
  def test
    @wallList = Wall.where("`post` LIKE ?", params[:q]+"%")
	render json: @wallList
    #respond_to do |format|
	#  format.json { render json: @wallList, status: :serached, location: @wallList }
	#end
  end
  
end
