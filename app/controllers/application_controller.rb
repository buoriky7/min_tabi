class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search
	# timelineが投稿済みが否か判断する
	helper_method :timeline_flag
	# 例外処理
	rescue_from ActiveRecord::RecordNotFound, with: :render_404
	rescue_from ActionController::RoutingError, with: :render_404

	def render_404
		render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
	end

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
end
