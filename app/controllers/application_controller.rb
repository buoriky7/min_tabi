class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# timelineが投稿済みが否か判断する
	helper_method :timeline_flag

	def timeline_flag
		@timeline_flag = Timeline.find_by(user_id: session[:user.id])
		# return timeline_flag
	end

	# deviseストロングパラメーター
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
	end
end
