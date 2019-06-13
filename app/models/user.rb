class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :nickname, presence: true, length: { maximum: 20 }

  # アソシエーション
  	has_many :timelines, dependent: :destroy
  	has_many :clips, dependent: :destroy
	has_many :articles, dependent: :destroy
	has_many :places, dependent: :destroy

  # 画像投稿
    attachment :profile_image
    attachment :header_image

end
