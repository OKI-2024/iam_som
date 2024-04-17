class Wine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :reviews
  belongs_to :region
  belongs_to :grape_variety, optional: true
  belongs_to :type
  has_one_attached :image

  validates :name, presence: { message: "ワイン名は必須です" }
  validates :image, presence: { message: "画像は必須です" }


  validates :grape_variety_id, numericality: { other_than: 1, allow_nil: true, message: "ブドウの品種を選択してください" }
  validates :type_id, numericality: { other_than: 1, allow_nil: true, message: "ワインのタイプを選択してください" }
  validates :region_id, numericality: { other_than: 1, allow_nil: true, message: "ワインの生産地を選択してください" }
  

end
