class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :index_desc, :edit, :update, :destroy_confirm]
  before_action :user_confirm!, only: [:edit, :update, :destroy_confirm, :destroy]
  before_action :admin_confirm!, only: [:index]

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all.order(id: "ASC")
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

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "退会処理が完了しました。ご利用ありがとうございました。"
      redirect_to "/"
    else
      flash[:danger] = "退会処理に失敗しました。"
      redirect_to "/"
    end

  end

  private
  def user_params
  	params.require(:user).permit(:last_name, :first_name, :nickname, :email, :profile,  :header_image, :profile_image)
  end

  def admin_confirm!
    if current_user.admin_flg == false
      flash[:notice] = "このデータは管理者のみがアクセスできます"
      redirect_to timelines_path
    end
  end

end
