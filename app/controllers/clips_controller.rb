class ClipsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@clips = Clip.all.page(params[:page]).per(15)
    @time_now = Time.now
  end

  def index_user
    # TODO:ソートする方法を思いつかなかったので後回し
   #  @timeline = Timeline.where(user_id: current_user.id)
  	# @clips = Clip.all.page(params[:page]).per(15)
  end

  def index_other
    # TODO:ソートする方法を思いつかなかったので後回し
  	# @clips = Clip.where.not(id: current_user.id).page(params[:page]).per(15)
  end

  def create
  @clip = Clip.create(user_id: current_user.id, timeline_id: params[:timeline_id])
  @timeline = Timeline.find_by(id: params[:timeline_id])
  end

  def destroy
      @clip = Clip.find_by(user_id: current_user.id, timeline_id: params[:timeline_id])
      @clip.destroy
      @timeline = Timeline.find_by(id: params[:timeline_id])
  end

  # テスト用
  def test_create
  @clip = Clip.create(user_id: current_user.id, timeline_id: params[:timeline_id])
  @timeline = Timeline.find_by(id: params[:timeline_id])
  end

  def test_destroy
      @clip = Clip.find_by(user_id: current_user.id, timeline_id: params[:timeline_id])
      @clip.destroy
      @timeline = Timeline.find_by(id: params[:timeline_id])
  end
end
