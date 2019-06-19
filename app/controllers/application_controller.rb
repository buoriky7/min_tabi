class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search
	# timelineが投稿済みが否か判断する
	helper_method :timeline_flag

	def timeline_flag
		@timeline_flag = Timeline.where(user_id: current_user.id).last
	end

	def set_search
		@q = Timeline.ransack(params[:q])
		@s_times = @q.result.page(params[:page]).per(10).reverse_order
	end


	# deviseストロングパラメーター
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :nickname])
	end

	# ログイン後のリダイレクト先を変更
	def after_sign_in_path_for(resource)
		timelines_path
	end

	# 管理者・ログイン中のユーザー識別
	def user_confirm!
	    if current_user.admin_flg == false && current_user.id != params[:id].to_i
		    flash[:notice] = "あなたのIDでは、この情報の削除、編集はできません。"
		    redirect_to timelines_path
	    end
	end
end
