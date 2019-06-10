class ClipsController < ApplicationController
  def index
  	@clips = Clip.all
  end

  def index_user
  	@clips = Clip.where(id: current_user.id)
  end

  def index_other
  	@clips = Clip.where.not(id: current_user.id)
  end

  def create
  	timeline = Timeline.find(params[:id])
  	clip = current_user.clips.new(timeline_id: timeline.id)
  	clip.save
  	redirect_to timeline_path(timeline)
  end

  def destroy
  	timeline = Timeline.find(params[:id])
  	clip = current_user.clips.new(timeline_id: timeline.id)
  	clip.destroy
  	redirect_to timeline_path(timeline)
  end
end
