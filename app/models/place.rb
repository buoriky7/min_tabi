class Place < ApplicationRecord
	# アソシエーション
		has_many :articles, dependent: :destroy
		belongs_to :user_id
end
