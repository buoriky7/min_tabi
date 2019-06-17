class Timeline < ApplicationRecord
	# アソシエーション
		has_many :articles, dependent: :destroy
		has_many :article_icons, dependent: :destroy
		has_many :clips, dependent: :destroy
		belongs_to :user

	# Clipしたユーザーのidの有無を調べる(user)の引数にはView毎にユーザー情報(current_user)を渡すこと
	def cliped_by?(user)
		clips.where(user_id: user.id).exists?
	end

	def clip_user(user_id)
		clips.find_by(user_id: user.id)
	end

end
