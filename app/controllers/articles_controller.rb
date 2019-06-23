class ArticlesController < ApplicationController
  before_action :authenticate_user!

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
      @article.article_icons.build
    # end
  end

  def edit
  	@article = Article.find(params[:id])
    @place = Place.find_by(id: @article.place_id)
    # TODO: timeline#edit,newと共通の処理。まとめたい
    if @article.user_id != current_user.id
      flash[:notice] = "あなたのIDでは、この情報の削除、編集はできません。"
      redirect_to timelines_path
    end
  end

  def create
  	@article = Article.new(article_params)
  	@article.user_id = current_user.id
  	timeline = Timeline.where(user_id: current_user.id).last
    @article.timeline_id = timeline.id
    @article.article_icons.each do |article_icon|
        article_icon.timeline_id = timeline.id
    end
    # 以下Placeモデルへの保存処理
    # Placeモデルが空の時は新規作成
    if Place.all.empty?
      @place = Place.new(place_params)
      @place.user_id = @article.user_id #TODO:user_idがname_error(userとアソシエーション中だと)
      @place.save
    else
      # TODO:もっと良いコードにできないだろうか？
      # Placeモデルに「current_userと同じuser_id」があればLoad, なければ.new
      @place = Place.find_or_initialize_by(place_params) #引数がストロングパラメーターだけだと、.newの時に困る
      if @place.new_record?
         @place.user_id = current_user.id #TODO:user_idがname_error(userとアソシエーション中だと)
         @place.save
      end
    end
    # Placeモデルへの保存処理ここまで。以下article保存
  	@article.place_id = @place.id
    if @article.save
    	flash[:success] = "記事を投稿しました！"
    	redirect_to new_timeline_path(timeline.id)
    else
    	flash[:danger] = "記事の投稿に失敗しました"
    	render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.article_icons.each do |article_icon|
        article_icon.timeline_id = @article.timeline_id
    end
    # 以下Placeモデルへの保存処理
    # Placeモデルが空の時は新規作成
    if Place.all.empty?
      @place = Place.new(place_params)
      @place.user_id = @article.user_id #TODO:user_idがname_error(userとアソシエーション中だと)
      @place.save
    else
      # TODO:もっと良いコードにできないだろうか？
      # Placeモデルに「current_userと同じuser_id」があればLoad, なければ.new
      @place = Place.find_or_initialize_by(place_params)
      if @place.new_record?
         @place.user_id = current_user.id #TODO:user_idがname_error(userとアソシエーション中だと)
         @place.save
      end
    end
    # Placeモデルへの保存処理ここまで。以下article保存
    @article.place_id = @place.id
    if @article.update(article_params)
      flash[:success] = "記事を更新しました！"
      if @article.timeline.post_flag == 1
        redirect_to timeline_path(@article.timeline.id)
      elsif @article.timeline.post_flag == 0
          redirect_to new_timeline_path(@article.timeline.id)
      else
        flash[:danger] = "予期せぬエラーです"
        redirect_to timelines_path
      end
    else
      flash[:danger] = "記事の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "記事を削除しました！"
      timeline_posted = Timeline.where(user_id: current_user.id).last
      if timeline_posted.post_flag == 1
        redirect_to timeline_path(timeline_posted.id)
      elsif timeline_posted.post_flag == 0
          redirect_to new_timeline_path(timeline_posted.id)
      else
        flash[:danger] = "予期せぬエラーです"
        redirect_to timelines_path
      end
    else
      flash[:danger] = "記事の削除に失敗しました。"
      redirect_to timelines_path
    end
  end

  private
  def article_params
  	params.require(:article).permit(
      :article_image, :caption, :body, :star,
      article_icons_attributes: [:id, :icon_id]
      )
  end
  def place_params
    params.require(:place).permit(:address, :latitude, :longitude)
  end
end
