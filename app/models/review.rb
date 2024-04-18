class Review < ApplicationRecord
  attr_accessor :fragrance_ids
  has_one_attached :image
  belongs_to :user
  belongs_to :wine
  has_many :fragrance_reviews, dependent: :destroy
  has_many :fragrances, through: :fragrance_reviews

  validates :content, length: { maximum: 240 }
  

  def self.wine_attributes
    [:sweetness, :bitterness, :acidity, :alcohol]
  end
  
end
