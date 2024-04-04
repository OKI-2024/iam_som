class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_likes
  has_many :likes, through: :user_likes
  has_many :follows
  has_many :reviews
  has_one_attached :avatar
end
