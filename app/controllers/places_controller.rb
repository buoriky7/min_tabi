class PlacesController < ApplicationController
	before_action :authenticate_user!
	# TODO: Article#newでネストしたデータは保存できないのか？　と思い、新設。しかし不要か？
	# rails delete controller Places
	def new
		@place = Place.new
  	    @place.articles.build
	end
	def create
		place = Place.new(place_params)
		place.save
	end

  private
  def place_params
  	params.require(:place).permit(:place_name, article_attributes:[:article_image, :caption, :body, :star] )
  end
end
