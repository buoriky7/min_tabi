class Timeline < ApplicationRecord
	# アソシエーション
		has_many :articles, dependent: :destroy
		has_many :article_icons, dependent: :destroy
		has_many :clips, dependent: :destroy
		belongs_to :user
end
