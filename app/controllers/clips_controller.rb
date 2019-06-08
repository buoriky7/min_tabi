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
end
