class Timeline < ApplicationRecord
	# アソシエーション
		has_many :articles, dependent: :destroy
		has_many :article_icons, dependent: :destroy
		has_many :clips, dependent: :destroy
		belongs_to :user

	# バリデーション
		validates :title, presence: true
		validate :article_presence?

	# Clipしたユーザーのidの有無を調べる(user)の引数にはView毎にユーザー情報(current_user)を渡すこと
	def cliped_by?(user)
		clips.where(user_id: user.id).exists?
	end

	def clip_user(user_id)
		clips.find_by(user_id: user.id)
	end

	# バリデーション用カスタムメソッド
	def article_presence?
		timeline_flag = Timeline.where(user_id: user.id).last
		unless timeline_flag.nil? || timeline_flag.post_flag == 1
			if articles.count == 0
				errors.add(:articles, ": 一記事以上の投稿が必要です。" )
			end
		end
	end

end
