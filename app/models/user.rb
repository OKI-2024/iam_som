class User < ApplicationRecord
       # Include default devise modules. Others available are:
       # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
       devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :validatable
       has_many :reviews
       has_one_attached :avatar
       
       # ニックネームのバリデーション
       validates :nickname, presence: true,
                            length: { maximum: 10 },
                            uniqueness: true
     
       # 自己紹介のバリデーション
       validates :introduction, length: { maximum: 240 },
                                allow_blank: true
     end
     