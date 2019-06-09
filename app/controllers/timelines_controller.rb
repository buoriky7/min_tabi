class TimelinesController < ApplicationController
  def index
  end

  def show
  end

  def edit
    # @timeline = Timeline.find(current_user.id)
  end

  def update
    #
  end

  def new
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
