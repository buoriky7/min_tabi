class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  	has_many :timelines, dependent: :destroy
  	has_many :clips, dependent: :destroy
	has_many :articles, dependent: :destroy
	has_many :places, dependent: :destroy

end
