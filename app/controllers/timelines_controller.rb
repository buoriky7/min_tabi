class TimelinesController < ApplicationController
  include CommonActions
  before_action :authenticate_user!, only: [:index_user, :index_other ,:edit, :update, :new, :post, :create, :destroy]

  def index
    @timelines = Timeline.all.page(params[:page]).per(10)
  end

  def index_user
    @timelines = Timeline.where(user_id: params[:id]).page(params[:page]).per(10)
  end

  def index_other
    @timelines = Timeline.all.where.not(user_id: current_user.id).page(params[:page]).per(10)
  end

  def show
    @timeline = Timeline.find(params[:id])
  end

  def edit
    @timeline = Timeline.find(params[:id])
  end

  def update
    timeline = Timeline.find(params[:id])
    if timeline.update(timeline_up_params)
      flash[:success] = "タイトルを更新しました！"
      redirect_to timeline_path(timeline.id)
    else
      flash[:danger] = "タイトルの更新に失敗しました"
      render :edit
    end
  end

  def new
    @timeline = Timeline.find(params[:id])
    @articles = Article.where(timeline_id: @timeline.id).order(id: "DESC")
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

  def destroy
    timeline = Timeline.find(params[:id])
    if timeline.destroy
      flash[:success] = "記事を削除しました"
      redirect_to timelines_path
    else
      flash[:danger] = '[Error!]記事を削除できませんでした'
      redirect_to timelines_path
    end
  end

  def lanking_clip
  end

  def lanking_article
  end

  private
  def timeline_up_params
    params.require(:timeline).permit(:title)
  end

end
