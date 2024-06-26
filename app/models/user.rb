class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_one_attached :avatar

  validates :nickname, presence: true,
                       length: { maximum: 10 },
                       uniqueness: true

  validates :introduction, length: { maximum: 240 },
                           allow_blank: true
end
