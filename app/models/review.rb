class Review < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :wine
  has_many :fragrance_reviews
  has_many :fragrances, through: :fragrance_reviews



  def self.wine_attributes
    %i[sweetness bitterness acidity alcohol]
  end
  
end
