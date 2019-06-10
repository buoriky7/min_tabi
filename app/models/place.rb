class Place < ApplicationRecord
	# アソシエーション
		has_many :articles, dependent: :destroy
		# belongs_to :user_id #TODOアソシエーションしてもuser_idを保存する方法

	# # articleとplaceにデータを保存する
	# 	accepts_nested_attributes_for :articles

	# # 画像投稿
	# 	attachment :article_image
end
