class Article < ApplicationRecord
	# アソシエーション
		has_many :article_icons, dependent: :destroy
		belongs_to :user
		belongs_to :place
		belongs_to :timeline

	# 画像投稿
		attachment :article_image

	# バリデーション
		validates :caption, presence: true, length: { maximum: 200 }
		validates :body, presence: true, length: { maximum: 300 }

end
