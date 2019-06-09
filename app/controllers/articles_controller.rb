class ArticlesController < ApplicationController
  def new
  	@place = Place.new
  	@place.articles.build
  	@article = Article.new
  end

  def edit
  	# place = Place.new(place_params)
  	# place.save
  	# redirect_to new_timelines_path
  	article = Article.find(current_user.id)
  	article.update
  end

# TODO: timeline_idを先に保存する方法を実装する
# TODO: Placeを保存する方法を実装する
  def create
  	@article = Article.new(article_params)
  	@article.user_id = current_user.id
  	timeline = Timeline.where(id: current_user.id).last
    @article.timeline_id = timeline.id
    binding.pry
  	@article.place_id = 1
    if @article.save
    	flash[:success] = "記事を投稿しました！"
    	redirect_to new_timelines_path
    else
    	flash[:danger] = "記事の投稿に失敗しました"
    	render :new
    end
  end

  private
  def article_params
  	params.require(:article).permit(:article_image, :caption, :body, :star)
  end
end
