class Clip < ApplicationRecord
	# アソシエーション
		belongs_to :user
		belongs_to :timeline
end
