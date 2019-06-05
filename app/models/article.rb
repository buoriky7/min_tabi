class Article < ApplicationRecord
	# アソシエーション
		has_many :article_icons, dependent: :destroy
		belongs_to :user
		belongs_to :place
		belongs_to :timeline

end
