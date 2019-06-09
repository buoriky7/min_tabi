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
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success] = "ユーザー情報を編集しました！"
  		redirect_to user_path(@user.id)
  	else
  		flash[:danger] = "ユーザー情報の編集に失敗しました"
  		render :edit
  	end
  end

  def destroy_confirm
  	@user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :nickname, :email, :profile)
  end
end
