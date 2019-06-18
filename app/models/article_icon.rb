class ArticleIcon < ApplicationRecord
	# アソシエーション
		belongs_to :article
		belongs_to :timeline

end
