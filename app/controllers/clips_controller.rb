class ClipsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@clips = Clip.where(user_id: current_user.id).order(id: 'DESC').page(params[:page]).per(15)
    @time_now = Time.now
  end

  def index_user
    @clips = Clip.where(user_id: current_user.id).order(id: 'DESC').page(params[:page]).per(15)
    @time_now = Time.now
  end

  def index_other
    @clips = Clip.where(user_id: current_user.id).order(id: 'DESC').page(params[:page]).per(15)
    @time_now = Time.now
  end

  def create
    @clip = Clip.create(user_id: current_user.id, timeline_id: params[:timeline_id])
    @timeline = Timeline.find_by(id: params[:timeline_id])
    if params[:t_show].to_i == 1
      redirect_to timeline_path(@timeline.id)
    end
  end

  def destroy
      @clip = Clip.find_by(user_id: current_user.id, timeline_id: params[:timeline_id])
      @clip.destroy
      @timeline = Timeline.find_by(id: params[:timeline_id])
      if params[:t_show].to_i  == 1
        redirect_to timeline_path(@timeline.id)
      end
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
