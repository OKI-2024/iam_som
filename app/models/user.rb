class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_one_attached :avatar
  
  
  validates :nickname, presence: { message: "ニックネームは必須です" },
                       length: { maximum: 10, too_long: "ニックネームは最大%{count}文字までです" },
                       uniqueness: { message: "このニックネームは既に使用されています" }

  validates :introduction, length: { maximum: 240, too_long: "自己紹介は最大%{count}文字までです" },
                           allow_blank: true

end
