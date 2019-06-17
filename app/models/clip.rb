class Clip < ApplicationRecord
	# Clip : お気に入り機能の中間モデル

	# アソシエーション
		belongs_to :user
		belongs_to :timeline


	# Clipしたユーザーのidの有無を調べる(user)の引数にはView毎にユーザー情報(current_user)を渡すこと
	def cliped_by?(user)
		clips.where(user_id: user.id).exists?
	end

	def clip_user(user_id)
		clips.find_by(user_id: user.id)
	end
end
