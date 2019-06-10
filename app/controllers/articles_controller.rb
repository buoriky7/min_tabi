class ArticlesController < ApplicationController
  def new
    timeline = Timeline.where(user_id: current_user.id).last
    # TODO:タイムラインは親切ボタンを作成するのがいいのでは？
    # if timeline_flag.nil? || timeline.post_flag == 1
    #   flash[:danger] = "記事を新規作成できませんでした。<br>ログインするか、こちらのページからタイムラインを新規作成してください。"
    #   redirect_to timelines_exception_create_path
    # else
      @place = Place.new
      @place.articles.build
      @article = Article.new
    # end
  end

  def edit
  	article = Article.find(current_user.id)
  	article.update
  end

  def create
  	@article = Article.new(article_params)
  	@article.user_id = current_user.id
  	timeline = Timeline.where(id: current_user.id).last
    @article.timeline_id = timeline.id
    if Place.all.empty?
      @place = Place.new(place_params)
      @place.user_id = @article.user_id #TODO:user_idがname_error(userとアソシエーション中だと)
      @place.save
    else
      # TODO:もっと良いコードにできないだろうか？
      @place = Place.find_or_initialize_by(place_params)
      if @place.new_record?
         @place.place_name = place_params
         @place.user_id = current_user.id #TODO:user_idがname_error(userとアソシエーション中だと)
         @place.save
      end
    end
  	@article.place_id = @place.id
    if @article.save
    	flash[:success] = "記事を投稿しました！"
    	redirect_to new_timeline_path(timeline.id)
    else
    	flash[:danger] = "記事の投稿に失敗しました"
    	render :new
    end
  end

  private
  def article_params
  	params.require(:article).permit(:article_image, :caption, :body, :star)
  end
  def place_params
    params.require(:place).permit(:place_name)
  end
end
