class UsersController < ApplicationController
  def show
  	@user = User.find(current_user.id)
  end

  def index
  end

  def edit
  end

  def destroy_confirm
  end
end
