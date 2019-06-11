class ClipsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@clips = Clip.all.page(params[:page]).per(15)
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
  	timeline = Timeline.find(params[:id])
  	clip = current_user.clips.new(timeline_id: timeline.id)
  	clip.save
  	redirect_to timeline_path(timeline)
  end

  def destroy
  	timeline = Timeline.find(params[:id])
  	clip = current_user.clips.find_by(timeline_id: timeline.id)
  	clip.destroy
  	redirect_to timeline_path(timeline)
  end
end
