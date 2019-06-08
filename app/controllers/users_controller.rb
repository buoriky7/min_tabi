class UsersController < ApplicationController
  def show
  	@user = User.find(current_user.id)
  end

  def index
  	@users = User.all.order(id: "ASC")
  	@user = User.find(1) #<!-- TODO:テスト用。後で消去する-->
  end

  def index_desc
  	@users = User.all.order(id: "DESC")
  end

  def edit
  end

  def destroy_confirm
  end
end
