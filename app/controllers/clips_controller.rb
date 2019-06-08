class ClipsController < ApplicationController
  def index
  	@clips = Clip.all
  end

  def index_user
  	@clips = Clip.where(current_user.id)
  end

  def index_other
  	@clips = Clip.where.not(current_user.id)
  end
end
