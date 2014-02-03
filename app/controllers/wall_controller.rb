class WallController < ApplicationController
  def index
    @wallList = Wall.all
  end
end
