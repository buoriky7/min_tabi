class TimelinesController < ApplicationController
  def index
  end

  def show
  end

  def edit
    @timeline = Timeline.find(params[:id])
  end

  def update
    #
  end

  def new
    @timeline = Timeline.find(params[:id])
    @articles = current_user.articles
  end

  def post
    timeline = Timeline.find(params[:id])
    timeline.post_flag = 1
    if timeline.save
      flash[:success] = "タイムラインを投稿しました！"
      redirect_to timeline_path(timeline.id)
    else
      flash[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def create
    timeline = Timeline.new
    timeline.user_id = current_user.id
    timeline.title = current_user.nickname + 'の旅行'
    timeline.clips_count = 0
    if timeline.save
      redirect_to new_article_path
    else
      flash[:danger] = '[Error!]記事の新規投稿に失敗しました'
      redirect_to "/"
    end
  end

  def lanking_clip
  end

  def lanking_article
  end
end
